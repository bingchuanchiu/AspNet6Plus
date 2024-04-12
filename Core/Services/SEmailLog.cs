using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Infrastructure.Models;
using System.Linq.Expressions;
using System.Reflection;

namespace Core.Services
{
    public class SEmailLog : IEmailLog
    {
        /*
         * GENERIC CONTROLLER INTERFACE FOR LOGGING FOR ALL EXCEPTIONS, EMAILS, USERS, AND DB LOGGING
         */
        private DbContext _DBContext;                     
        private DbSet<EmailLog> _EmailLogs;

        private bool disposedValue;

        public SEmailLog(DbContext dbContext, EmailLog emailLog, int UserID)
        {
            if (dbContext != null && emailLog != null && UserID > 0)
            {
                _DBContext = dbContext;                
                emailLog.CreatedBy = UserID;
                _EmailLogs.Add(emailLog);
                _DBContext.SaveChanges();
            }  
            else
            {
                throw new ArgumentException("Please use all required parameters");
            }
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                    _DBContext = null;
                    _EmailLogs = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        // // TODO: override finalizer only if 'Dispose(bool disposing)' has code to free unmanaged resources
        // ~SDblogsController()
        // {
        //     // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
        //     Dispose(disposing: false);
        // }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}
