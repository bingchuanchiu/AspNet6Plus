using Quartz;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace Infrastructure.QuartzJobs
{

    public class WakeUpServerJob : IJob
    {
        public virtual Task Execute(IJobExecutionContext context)
        {
            
            using (WebClient client = new WebClient())
            {
                //client.UploadString("http://lfkqbwtweb02/quartz-scheduler/weatherforecast", string.Empty);
                //var temp = client.DownloadData("http://lfkqbwtweb02/quartz-scheduler/weatherforecast");

                var temp = client.DownloadData("http://localhost:5000/api/HomeAPI");
            }

            //context
            return Task.CompletedTask;
        }

        
    }

    
}