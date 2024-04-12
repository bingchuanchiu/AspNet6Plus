using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Core.Services;
using Infrastructure.Models;
using System.Linq.Expressions;
using Microsoft.AspNetCore.Hosting;
using Core.Static;
using Microsoft.AspNetCore.Authorization;

namespace WebAPI.Controllers
{
   
    [Route("api/[controller]")]
    [ApiController]
    public class HomeAPIController : ControllerBase
    {        
        private SUserLog _UserLog = new SUserLog();
        private readonly IHttpContextAccessor _httpContextAccessor;

        /*
         * 8-8-2022 eod initial loading takes too long. streamline it.
         * 9-19-2023 https://learn.microsoft.com/en-us/aspnet/core/fundamentals/http-context?view=aspnetcore-5.0
         */
        private readonly IAuthentication _authenticationService = new SAuthentication();
        private readonly IAuthorization _authorizationService = new SAuthorization();        

        public HomeAPIController(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;

            SLoggedInUser.userID = _authenticationService.loggedInUserID;

            try
            {
                // 9-20-2023 THIS WORKS ON THE SERVER BUT WILL CAUSE A FATAL BUG LOCALLY BECAUSE IT IS TRYING TO GET THE CURRENT LOGIN USER FROM NTLM
                SLoggedInUser.userName = _httpContextAccessor.HttpContext.User.Identity.Name.ToString().Remove(0, 3);
            }
            catch
            {
                // THIS TAKES THE CURRENT LOGIN USER OF THE SYSTEM.
                SLoggedInUser.userName = Environment.UserName;

            }

            SLoggedInUser.permissions = _authorizationService.InitAuthorizations(SLoggedInUser.userName);
        }

        [HttpGet]
        public ActionResult<IEnumerable<string>> Home()
        {
            var temp = new List<string>();

            temp.Add("Home Page");

     

            _UserLog.UserLogger(SLoggedInUser.userID, "HomeAPIController", "Home");            

            return temp;
        }

        /// <summary>
        /// 8/5/2022 Environment.UserName WORKS WHEN TESTED LOCALLY. NOT SURE IF WILL WORK ON ACTUAL IIS 
        /// request may only work from a brower and not with test
        /// </summary>
        /// <returns></returns>
        // GET: api/SettingsAPI/username

        [HttpGet("username")]
        public string GetUsername()
        {
            //string temp = "";

            return SLoggedInUser.userName;

            //return temp;
        }

        [HttpGet("getpermissions")]
        public ActionResult<IEnumerable<string>> GetUsernamePermissions()
        {
            var result = SLoggedInUser.permissions;

            return result;
        }

        [HttpGet("headers")]
        public ActionResult<IEnumerable<string>> GetHeaders()
        {
            var temp = Request.Headers ;
            var result = new List<string>();
            foreach (var header in temp)
            {
                result.Add("key: " + header.Key + " value: " + header.Value + Environment.NewLine + "</BR></BR>");
            }
            
            // TESTING ON THE SAME COMPUTER AS THE SERVER WILL RESULT IN ::1
            var serverIP = Request.HttpContext.Connection.LocalIpAddress?.ToString();
            var clientIP = Request.HttpContext.Connection.RemoteIpAddress?.ToString();

            result.Add("LocalIpAddress: " + serverIP + "</BR></BR>");
            result.Add("RemoteIpAddress: " + clientIP + "</BR></BR>");            

            return result;
        }

        [HttpGet("UrlReferrer")]
        public string UrlReferrer()
        {
            return Request.GetTypedHeaders()?.Referer?.ToString();
        }     
    }
}
