using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Core.Static;
using Infrastructure.Repositories;
using System.Security.Principal;
using System.Security.Claims;
using System.Web;

namespace Core.Services
{
    public class SAuthentication : IAuthentication
    {
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        public string loggedInUser { get; set; }
        public int loggedInUserID { get; set; }
        private bool _disposedValue;
        public bool UserAuth;

        public SAuthentication() 
        {
            GetAuthentication();
        }

        public bool GetAuthentication(string username = null, string password = null)
        {
            bool result = false; 

            if (username != null && password != null)
            {

                var tempUser = (from Users in _DBContext.Users
                        join Passwords in _DBContext.Passwords
                        on Users.UserId equals Passwords.UserId
                        where Users.Username.ToLower() == username.ToLower()
                        & Passwords.PasswordSecret == password
                        select Users.UserId
                                );

                if (tempUser.Count() > 0)
                {
                    loggedInUser = username;
                    loggedInUserID = tempUser.ToList()[0];
                    result = true;
                }
            } 
            else //WINDOWS AUTHENTICATION - DEBUG IS NOT GOING TO DIRECTLY COME IN HERE BECAUSE IT IS REFERENCING THE COMPILED OBJECT.
            {
                //loggedInUser = System.Security.Claims.User.Identity.Name.Split("\\".ToCharArray()).LastOrDefault();
                // loggedInUser = System.Security.Principal.WindowsIdentity.GetCurrent().Name.Split('\\').LastOrDefault(); // THIS ONE WORKS BUT ONLY FOR WINDOWS USERS
                /*
                 * SEEMS TO WORK FOR BOTH WINDOWS AND UNIX
                 * https://docs.microsoft.com/en-us/dotnet/api/system.environment.username?view=net-6.0
                 * httpshttps://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-6.0://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-6.0
                 */

                /*	    GOT THIS FROM BYPASS
                 *	    //Get most powerful role of context.User
	                    var loggedInUserName = context.User.Identity.Name.Split("\\".ToCharArray()).LastOrDefault();
    	                var user = _applicationUserService.Queryable().Where(i => i.UserName.Equals(loggedInUserName)).FirstOrDefault();
                 */

                //Environment.UserName will get the computer and not via applicationPoolIdentity

                // GIVE ME THE DS\ACCOUNT ==> DS\bchiu

                // THIS LINE IS SUPPOSE TO REMOVE DS\ FROM THE USERNAME. BUT SOME HOW ITS KEEPING IT IN MEMORY.
                if (SLoggedInUser.userName != null)
                {
                    loggedInUser = SLoggedInUser.userName;
                }
                else
                {
                    loggedInUser = "guest";
                }

                // loggedInUser = _httpContextAccessor.HttpContext.User.Identity.Name;

                var tempUser = (from Users in _DBContext.Users
                                 //join Passwords in _DBContext.Passwords
                                 //on Users.UserId equals Passwords.UserId
                             where Users.Username.ToLower() == loggedInUser
                             //& Passwords.PasswordSecret == password
                             select Users.UserId
                                );

                if (tempUser.Count() > 0) {
                    loggedInUserID = tempUser.ToList()[0];
                    result = true;
                }               
                
            }            

            return result;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                    loggedInUser = null;
                    UserAuth = false;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null           
                _disposedValue = true;
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
