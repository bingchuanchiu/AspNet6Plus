using Quartz;
using System;
using System.Threading.Tasks;
using Infrastructure.Services;
using Infrastructure.Interfaces;

namespace Infrastructure.QuartzJobs
{
    public class MailScheduler : IJob
    {
        public IEmail email = new SEmail();
        
        public virtual Task Execute(IJobExecutionContext context)
        {
            string to = "bchiu@dep.nyc.gov";
            string subject = "SimpleArhitechture - Quartz Example";
            string message = "this email is blah blah at " + DateTime.Now;

            email.SendEmail(to, subject, message);
;
            //context
            return Task.CompletedTask;
        }
    }
}
