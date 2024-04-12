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
using Core.Static;
using Infrastructure.Repositories;

namespace Core.Services
{
    public class SUserLog : IUserLog
    {
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        private DbSet<UserLog> _UserLogs;
        
        private bool disposedValue;

        public SUserLog()
        {
            _UserLogs = _DBContext.UserLogs;
        }

        public async void UserLogger(int uid, string controller, string action, string msg = null)
        {
            var userLogs = new UserLog();
            userLogs.Controller = controller;
            userLogs.Action = action;
            userLogs.UserAgent = SLoggedInUser.userAgent;
            userLogs.UrlCurrent = SLoggedInUser.curURL;
            userLogs.UrlReferral = SLoggedInUser.refURL;
            userLogs.ClientIp = SLoggedInUser.clientIP;
            userLogs.Message = msg;            
            userLogs.CreatedAt = DateTime.Now;
            userLogs.CreatedBy = uid > 0 ? uid : 0;
            await _UserLogs.AddAsync(userLogs);
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
                    _UserLogs = null;
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
    }
}
