using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using System.Linq.Expressions;
using System.Reflection;
using Infrastructure.Models;
using Infrastructure.Interfaces;
using Infrastructure.Services;
using Infrastructure.Repositories;

namespace Core.Services
{
    public class SExceptionLog : IExceptionLog, IEmail
    {
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        private DbSet<ExceptionLog> _ExceptionLog;
        
        private IEmail _email = new SEmail();

        private bool disposedValue;

        public SExceptionLog()
        {
            _ExceptionLog = _DBContext.ExceptionLogs;
        }

        public async void ExceptionLogger(int uid, Exception ex)
        {
            var exLogs = new ExceptionLog();
            exLogs.Message = ex.Message != null ? ex.Message.ToString() : "No Message Provided";
            exLogs.InnerException = ex.InnerException != null ? ex.InnerException.ToString() : "No InnerException Provided";
            exLogs.StackTrace = ex.StackTrace != null ? ex.StackTrace.ToString(): "No StackTrace Provided";
            exLogs.CreatedAt = DateTime.Now;
            exLogs.CreatedBy = uid > 0 ? uid : 0;
            await _ExceptionLog.AddAsync(exLogs);

            // FIND THE USER WHO TRIGGERED THE EXCEPTION
            Task<List<string>> username = (from Users in _DBContext.Users
                                   where Users.UserId == uid
                               select Users.Username).ToListAsync();

            // SEND EMAIL TO USER 1 AND ADMIN GROUP 
            Task<List<string>> toList = (from Users in _DBContext.Users
                                   where Users.UserId == 1 & Users.EmailNotifications != false
                                   select Users.Email).ToListAsync();

            Task<List<string>> toListGroup = (from Users in _DBContext.Users
                                        join UserAssignedGroups in _DBContext.UserAssignedGroups
                                        on Users.UserId equals  UserAssignedGroups.UserId
                                        join Groups in _DBContext.Groups
                                        on UserAssignedGroups.GroupId equals Groups.GroupId
                                        where Groups.GroupName.ToLower().Contains("admin") &
                                        Users.UserId == 1 & Users.EmailNotifications != false & Groups.EmailNotifications != false
                                        select Users.Email).ToListAsync();

            (await toList).Union(await toListGroup).Distinct();

            string subject = "Exception Caught & Requires Attention";
            string msg = (await username)[0] + " has triggered an exception at " + exLogs.CreatedAt + "<br/>";
            msg += "Message: " + exLogs.Message.ToString() + "<br/>";
            msg += "InnerException: " + exLogs.InnerException.ToString() + "<br/>";
            msg += "StackTrace: " + exLogs.StackTrace.ToString() + "<br/>";
            
            if ((await toList).Count > 1)
            {
                _email.SendEmailList((await toList), subject, msg);
            }
            else
            {
                _email.SendEmail((await toList)[0], subject, msg);
            }

            

            await _DBContext.SaveChangesAsync();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                    _DBContext = null;
                    _ExceptionLog = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        public bool SendEmail(string to, string subject, string message, string cc, string bcc)
        {
            return _email.SendEmail(to, subject, message, cc, bcc);
        }

        public bool SendEmailList(List<string> toList, string subject, string message)
        {
            return _email.SendEmailList(toList, subject, message);
        }
    }
}
