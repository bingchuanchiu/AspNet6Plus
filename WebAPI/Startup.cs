using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Quartz;
using Quartz.Impl.Calendar;
using Quartz.Impl.Matchers;
using Quartz.Plugin.Interrupt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Services;
using Core.Interfaces;
using Infrastructure.QuartzJobs;
using Microsoft.AspNetCore.Http;
using Infrastructure.Repositories;
using Microsoft.AspNetCore.OData;
using System.Diagnostics;
using Infrastructure.Models;

namespace WebAPI
{
    public class Startup
    {
        public IConfiguration Configuration { get; }


        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            /*********************************************
             * 8-11-2022 HAVE NOT TESTED CORS YET. SHOULD ALLOW LOCALHOST
             * 12-2-2022 TESTED AND SEEMS TO WORK.
             ********************************************/
            services.AddCors(
                options => options.AddPolicy("MyCORsPolicy", 
                policy => policy.WithOrigins(
                    "http://localhost/", "http://localhost:4200")
                .AllowAnyHeader()
                .AllowAnyMethod()
                ));

            /*
             * Microsoft.AspNetCore.OData v8.0 or greater. 
             */
            services.AddControllers().AddOData(opt =>
            {                
                opt.EnableQueryFeatures();

            });

            /* services.AddSwaggerGen(c =>
             {
                 c.SwaggerDoc("v1", new OpenApiInfo { Title = "MVC5", Version = "v1" });
             });*/
            // services.AddHttpContextAccessor(); // DOES NOT SEEM TO WORK FOR WEBAPI... THIS MAY WORK FOR WEBFORM
            // 

            services.AddQuartz(q =>
            {
                // handy when part of cluster or you want to otherwise identify multiple schedulers
                q.SchedulerId = "Scheduler-Core";

                // you can control whether job interruption happens for running jobs when scheduler is shutting down
                q.InterruptJobsOnShutdown = true;

                // when QuartzHostedServiceOptions.WaitForJobsToComplete = true or scheduler.Shutdown(waitForJobsToComplete: true)
                q.InterruptJobsOnShutdownWithWait = true;

                // we can change from the default of 1
                q.MaxBatchSize = 5;

                // we take this from appsettings.json, just show it's possible
                // q.SchedulerName = "Quartz ASP.NET Core Sample Scheduler";

                // this is default configuration if you don't alter it
                q.UseMicrosoftDependencyInjectionJobFactory();

                // these are the defaults
                q.UseSimpleTypeLoader();
                q.UseInMemoryStore();
                q.UseDefaultThreadPool(maxConcurrency: 10);

                /*
                 * THIS TASK IS REQUIRED TO KEEP THE WEBSITE ALIVE!
                 */

#if DEBUG != true
                JobKey jobKeyWakeUpServerJob = new JobKey("Quartz Job - WakeUpServer");
                q.ScheduleJob<WakeUpServerJob>(trigger => trigger
                    .ForJob(jobKeyWakeUpServerJob)
                    //.WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(12,5))
                    .WithCronSchedule("0 0/15/30/45 0-23 * * ?") //THIS ONE IS EVERY 15 MINS 24/7.
                );
#endif
/* ****************************
 * 8-15-2022 my first job -confirmed to work 8-15-2022 @ 347pm
 * 8-16-2022 QUARTZ AND HANGFIRE RUN IN PROCESS AND IS SUBJECTED TO IIS IDLE TIMEOUT. DEFUALT IS SET TO 20 MINS
 * 1440 MINS IS EQUAL TO A DAY OF WEBSITE INACTIVE BEFORE IIS RECYCLES IT
 * ****************************
 * https://www.quartz-scheduler.net/documentation/quartz-2.x/tutorial/crontriggers.html#example-cron-expressions
 * WithCronSchedule function params: Seconds,Minutes,Hours,Day-of-Month,Month,Day-of-Week,Year (optional field)
 * Individual sub-expressions can contain ranges and/or lists. For example, the day of week field in the previous (which reads "WED") example could be replaces with "MON-FRI", "MON, WED, FRI", or even "MON-WED,SAT".
 * All of the fields have a set of valid values that can be specified. These values should be fairly obvious - such as the numbers 0 to 59 for seconds and minutes, and the values 0 to 23 for hours. Day-of-Month can be any value 0-31, but you need to be careful about how many days are in a given month! Months can be specified as values between 0 and 11, or by using the strings JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV and DEC. Days-of-Week can be specified as vaules between 1 and 7 (1 = Sunday) or by using the strings SUN, MON, TUE, WED, THU, FRI and SAT
 * The '/' character can be used to specify increments to values. For example, if you put '0/15' in the Minutes field, it means 'every 15 minutes, starting at minute zero'. If you used '3/20' in the Minutes field, it would mean 'every 20 minutes during the hour, starting at minute three' - or in other words it is the same as specifying '3,23,43' in the Minutes field.
 * The '?' character is allowed for the day-of-month and day-of-week fields. It is used to specify "no specific value". This is useful when you need to specify something in one of the two fields, but not the other. See the examples below (and CronTrigger API documentation) for clarification.
 * The 'L' character is allowed for the day-of-month and day-of-week fields. This character is short-hand for "last", but it has different meaning in each of the two fields. For example, the value "L" in the day-of-month field means "the last day of the month" - day 31 for January, day 28 for February on non-leap years. If used in the day-of-week field by itself, it simply means "7" or "SAT". But if used in the day-of-week field after another value, it means "the last xxx day of the month" - for example "6L" or "FRIL" both mean "the last friday of the month". When using the 'L' option, it is important not to specify lists, or ranges of values, as you'll get confusing results.
 * Wild-cards (the '' character) can be used to say "every" possible value of this field. Therefore the '' character in the "Month" field of the previous example simply means "every month". 
 * A '*' in the Day-Of-Week field would obviously mean "every day of the week".
 */

#if DEBUG != true

                JobKey jobKeyEmailTest = new JobKey("Quartz Job - Email Test");
                q.ScheduleJob<MailScheduler>(trigger => trigger
                    .ForJob(jobKeyEmailTest)
                    .WithCronSchedule("0 0/15/30/45 0-23 * * ?") //THIS ONE IS EVERY 15 MINS 24/7.
                );

#endif
                /* IDLE TIMEOUT MAX IS 1440 
                 * 8-16-2022 TUE TEST, STARTED AT 11:15 AM BUT ENDED SHORT AT 11:22AM OR SO. 12pM AND 1PM DID NOT START
                 * 8-17-2022 WED TEST 1, IIS APP POOL-> IDLE TIME-OUT: 1440 (1 DAY), IDLE TIME-OUT ACTION: SUSPEND
                 * STARTED AT 10:18AM - 11:04AM, MANUALLY STOP. TOTAL 46 MINS BEFORE MANUALLY TERMINATED
                 * 8-17-2022 WED TEST 2, IIS APP POOL-> IDLE TIME-OUT: 20, IDLE TIME-OUT ACTION: SUSPEND
                 * STARTED AT 11:18AM - 11:55AM, MANUALLY STOP. TOTAL 37 MINS BEFORE MANUALLY TERMINATED
                 * 8-18-2022 THU-FRI TEST 3, IIS APP POOL-> IDLE TIME-OUT: 20, IDLE TIME-OUT ACTION: SUSPEND
                 * STARTED IN THE AFTERNOON AND WAS STILL GOING WHEN I CAME IN THE NEXT MORNING.
                 * THE WAKEUP SCHEUDLED TASK WORKED!!!
                 */
            });

            // ASP.NET Core hosting
            services.AddQuartzServer(options =>
            {
                // when shutting down we want jobs to complete gracefully
                options.WaitForJobsToComplete = false; // just shut down!!!
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors("MyCORsPolicy");

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();

            //    app.UseSwagger();
              ///  app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "MVC5 v1"));
            } 
            else if (env.IsStaging())
            {
               // SeedSolutionContext.
            }
            else if (env.IsProduction())
            {
                
            }

            app.UseHsts();
            app.UseRouting();

            //app.UseAuthentication();

            //app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();                
                
            });
        }
    }
}
