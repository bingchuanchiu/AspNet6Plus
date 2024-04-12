using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using System.Linq.Expressions;
using System.Reflection;
using System.Data;
using System.Transactions;
using Microsoft.AspNetCore.Http;
using Core.Static;
using Infrastructure.Repositories;
using Microsoft.AspNetCore.Authorization;

namespace Core.Services
{

    public class SEntityAPIController<TEntity> : IEntityAPIController<TEntity> where TEntity : class, new()
    {
        /*
         * SIMPLE CONTROLLER CLASS THAT IMPLEMENTS INTERFACE FOR WEB API
         * SettingAPIController is working
         * UPDATE SERVICE TO REPOSITORY
         */
        public JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        public DbSet<TEntity> _DBSet { get; set; }
        //private TEntity _Entity;
        private int _UserID;
        private string _Controller;
        //private string _Action;
        private bool _DisposedValue;
        public int _RecordSetLimit;

        private IUserLog _UserLog = new SUserLog();
        private IExceptionLog _ExLogs = new SExceptionLog();
        private IDblog<TEntity> _Dblogs = new SDblog<TEntity>();
        //private SAuthorization _authorizationService = new SAuthorization();

        /*
         * 6-30-2022
         * THIS INTERFACE IS COMPLETED - THIS IS READY TO GO!!!
         * THIS INTERFACE HAS INTERGRATED 
         * *** AUTHENTICATION (USER LOGINS) 
         * *** AUTHORIZATION (USER / GROUP PERMISSIONS)
         * *** USER LOGS (TRACK USER ACCESS)
         * *** EXCEPTION LOGS (TRACK APP EXCEPTIONS)
         * *** DB LOGS (TRACK DB TABLE CHANGES)
    
         */
    
        public SEntityAPIController()//IEntityAPI<TEntity> service)
        {
            // _DBContext = dbContext;
            _DBSet = _DBContext.Set<TEntity>();            
            //  _Entity = new TEntity();
            _RecordSetLimit = 5000;
            _UserID = SLoggedInUser.userID;

            TEntity model = new TEntity();
            _Controller = model.GetType().Name; //GET CURRENT TABLE NAME
        }

        /******************************************
         * WEB API FUNCTIONS
         *****************************************/

        /*
         * IMPLEMENT THIS CLASS WITH DEPENDENCY INJECT IN THE CONTROLLER CLASSES
         */


        /* **************************************************************************************************************************
         * 
         * 9-19-2023
         * FOR TESTING PURPOSES ALL GET AND GET ONE WILL DISPLAY TABLE DATA BUT WILL STILL LOG THE PROPER MESSAGES IN THE USER LOGS.
         * 
         * **************************************************************************************************************************/

        // [HttpGet]
        public DbSet<TEntity> GetEntities()
        {
            var temp = _DBSet;//new List<TEntity>();

            if (SLoggedInUser.permissions != null)
            {
                if (SLoggedInUser.GetAuthorization(_Controller, "Read") == true)
                {

                    //using (var tranx = _DBContext.Database.BeginTransaction())
                    {
                        try
                        {
                            //throw new Exception("This is a test for exception send email to admin");
                            temp = _DBSet;
                            //tranx.Commit();
                            _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Granted");
                        }
                        catch (Exception ex)
                        {
                            _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied - Refer to Exception logs");
                            _ExLogs.ExceptionLogger(_UserID, ex);
                             //tranx.Rollback();
                        }
                    }
                }
                else
                {
                    //temp = null;
                    _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied");
                }
            }
            else
            {
                //temp = null;
                _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied - Permissions Not Initialized");
            }

            return temp;
        }

        //[HttpGet("{ID}")]
        public async Task<ActionResult<TEntity>> GetEntity(int ID)
        {
            var temp = new TEntity();

            if (SLoggedInUser.permissions != null)
            {
                if (SLoggedInUser.GetAuthorization(_Controller, "Read") == true)
                {
                    //using (var tranx = _DBContext.Database.BeginTransaction())
                    {
                        try
                        {
                            temp = await _DBSet.FindAsync(ID);
                            //await tranx.CommitAsync();
                            _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Granted");
                        }
                        catch (Exception ex)
                        {
                            _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied - Refer to Exception logs");
                            _ExLogs.ExceptionLogger(_UserID, ex);
                            //await tranx.RollbackAsync();
                        }
                    }
                }
                else
                {
                    //temp = null;
                    _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied");
                }
            }
            else
            {
                //temp = null;
                _UserLog.UserLogger(_UserID, _Controller, "Read", "Access Denied - Permissions Not Initialized");
            }

            return temp;
        }

        //[HttpPut("{ID}")]
        public async Task<bool> PutEntity(int ID, TEntity TEntity)
        {
            bool temp = false;

            if (SLoggedInUser.permissions != null)
            {
                if (SLoggedInUser.GetAuthorization(_Controller, "Update") == true)
                {
                    var found = _DBSet.Find(ID);

                    using (var tranx = _DBContext.Database.BeginTransaction())
                    {
                        try
                        {
                            if (ID > 0 && TEntity != null)
                            {                                                                                                                        
                                await _Dblogs.DatabaseLogger(_UserID, found, TEntity);
                                _DBContext.Entry(found).CurrentValues.SetValues(TEntity);
                                await _DBContext.SaveChangesAsync();
                                await tranx.CommitAsync();      

                                if (tranx.CommitAsync().IsCompleted == true)
                                {
                                    _UserLog.UserLogger(_UserID, _Controller, "Update", "Access Granted");
                                }
                                
                            } else
                            {
                                temp = false;
                                _UserLog.UserLogger(_UserID, _Controller, "Update", "Access Denied - Duplicate Record Found!");
                            }
                        }
                        catch (Exception ex)
                        {
                            _UserLog.UserLogger(_UserID, _Controller, "Update", "Access Denied - Refer to Exception logs");
                            _ExLogs.ExceptionLogger(_UserID, ex);
                            await tranx.RollbackAsync();
                        }
                    }
                    
                }
                else
                {                    
                    _UserLog.UserLogger(_UserID, _Controller, "Update", "Access Denied");
                }
            }
            else
            {
                _UserLog.UserLogger(_UserID, _Controller, "Update", "Access Denied - Permissions Not Initialized");
            }

            return temp;               
        }

       // [HttpPost]
        public async Task<int> PostEntity(TEntity TEntity, bool DupCheck = false)
        {
            /*******************************************
             * DUPCHECK IN THE CONTROLLER IS REQUIRED 
             *******************************************/
            int temp = 0;  
            
            if (DupCheck == false)
            {
                if (SLoggedInUser.permissions != null)
                {
                    if (SLoggedInUser.GetAuthorization(_Controller, "Write") == true)
                    {
                        TEntity NullifyTEntity = new TEntity();

                        using (var tranx = _DBContext.Database.BeginTransaction())
                        {
                            try
                            {
                                if (TEntity != null)
                                {
                                    await _DBSet.AddAsync(TEntity); 
                                    await _Dblogs.DatabaseLogger(_UserID, NullifyTEntity, TEntity);
                                    await _DBContext.SaveChangesAsync();
                                    await tranx.CommitAsync();
                                    
                                    temp = 1;

                                    if (tranx.CommitAsync().IsCompleted == true )
                                    {
                                        _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Granted");
                                    }
                                }
                                else
                                {
                                    _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Denied - No Record Submitted!");
                                }
                            }
                            catch (Exception ex)
                            {
                                _ExLogs.ExceptionLogger(_UserID, ex);
                                await tranx.RollbackAsync();
                                _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Denied - Refer to Exception logs");
                            }
                        }

                    }
                    else
                    {
                        _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Denied");
                    }
                }
                else
                {
                    _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Denied - Permissions Not Initialized");
                }
            }
            else
            {
                _UserLog.UserLogger(_UserID, _Controller, "Write", "Access Denied - Duplicate Record Found!");
            }

            

            return temp;
        }

        [HttpDelete("{ID}")]
        public async Task<bool> DeleteEntity(int ID)
        {
            /*
             * CASCADE DELETE MUST BE IMPLEMENTED IN THE CONTROLLER
             * 
             */
            bool temp = false;
            TEntity NullifyTEntity = new TEntity();            

            if (SLoggedInUser.permissions != null)
            {
                if (SLoggedInUser.GetAuthorization(_Controller, "Delete") == true)
                {
                    using (var tranx = _DBContext.Database.BeginTransaction())
                    {
                        try
                        {
                            var found = await _DBSet.FindAsync(ID);
                            if (found != null)
                            {
                                _DBSet.Remove(found);                                                                                                
                                await _Dblogs.DatabaseLogger(_UserID, found, NullifyTEntity);
                                await _DBContext.SaveChangesAsync();
                                await tranx.CommitAsync();
                                
                                temp = true;

                                if (tranx.CommitAsync().IsCompleted == true)
                                {
                                    _UserLog.UserLogger(_UserID, _Controller, "Delete", "Access Granted");
                                }
                            }
                            else
                            {
                                temp = false;
                                _UserLog.UserLogger(_UserID, _Controller, "Delete", "Access Denied - Record Not Found!");
                            }
                        }
                        catch (Exception ex)
                        {
                            _ExLogs.ExceptionLogger(_UserID, ex);
                            await tranx.RollbackAsync();
                            _UserLog.UserLogger(_UserID, _Controller, "Delete", "Access Denied - Refer to Exception logs");
                        }
                    }
                    
                }
                else
                {                    
                    _UserLog.UserLogger(_UserID, _Controller, "Delete", "Access Denied");
                }
            }
            else
            {
                _UserLog.UserLogger(_UserID, _Controller, "Delete", "Access Denied - Permissions Not Initialized!");
            }

            return temp;
        }

        public void ControllerLogger(HttpRequest httpRequest)
        {
            if (httpRequest == null)
            {
                SLoggedInUser.userAgent = "Unit Testing, Request User-Agent Not Found!";
                SLoggedInUser.curURL = "Unit Testing, Request Host Not Found!";
                SLoggedInUser.refURL = "Unit Testing, Request Referer Not Found!";                
            }
            else
            {
                SLoggedInUser.userAgent = httpRequest.Headers["User-Agent"];
                SLoggedInUser.curURL = httpRequest.Headers["Host"];
                SLoggedInUser.refURL = httpRequest.Headers["Referer"];                
            }

            // TESTING ON THE SAME COMPUTER AS THE SERVER WILL RESULT IN ::1
            //var serverIP = httpRequest.HttpContext.Connection.LocalIpAddress?.ToString();
            var clientIP = httpRequest.HttpContext.Connection.RemoteIpAddress?.ToString();

            SLoggedInUser.clientIP = clientIP;

        }


        /******************************************
         * OTHER FUNCTIONS
         *****************************************/

        protected virtual void Dispose(bool disposing)
        {
            if (!_DisposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)

                    _DBContext = null;
                    _DBSet = null;
                    _Controller = null;
                    _UserLog = null;
                    _ExLogs = null;
                    _Dblogs = null;
                    //_authorizationService = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                _DisposedValue = true;
            }
        }

        public void Dispose()
        {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }


    }
}
