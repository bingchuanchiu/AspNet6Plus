using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Core.Services;
using Infrastructure.Models;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using Core.Static;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserLogAPIController : ControllerBase, IEntityAPIControllerBase<UserLog>
    {
        private readonly IEntityAPIController<UserLog> _controllerService;    

        public UserLogAPIController()
        {
            _controllerService = new SEntityAPIController<UserLog>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserLog>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x=>x.UserLogId).ToListAsync();
        }

        // GET: api/UserLogAPI/5
        //[HttpGet("{id}")]
        public async Task<ActionResult<UserLog>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/UserLogAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, UserLog TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/UserLogAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        public async Task<int> PostEntity(UserLog TEntity)
        {

            int temp = 0;
           // bool dupCheck = DupCheck(TEntity.Message.ToString(), TEntity.InnerException.ToString(), TEntity.StackTrace.ToString());

            ControllerLogger();

            //TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity);
            /*
            if (dupCheck == false)
            {
                temp = GetID(TEntity.Message.ToString(), TEntity.InnerException.ToString(), TEntity.StackTrace.ToString());
            }*/
                        
            return temp;
        }

        // DELETE: api/UserLogAPI/5
        //[HttpDelete("{id}")]
        public async Task<bool> DeleteEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.DeleteEntity(ID);
        }

        /*
         * USE THE # OF FIELDS THAT MAKES SENSE TO THE MODEL
         * FOR DupCheck AND GetID
         */

        public bool DupCheck(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            //var temp = _controllerService._DBSet.Where(x => x.Message.ToString() == NoDupKey1 && x.InnerException.ToString() == NoDupKey2 && x.StackTrace.ToString() == NoDupKey3);
            return false;// temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            //var temp = _controllerService._DBSet.Where(x => x.Message.ToString() == NoDupKey1 && x.InnerException.ToString() == NoDupKey2 && x.StackTrace.ToString() == NoDupKey3).OrderBy(y=>y.UserLogId).Select(x => x.UserLogId);
             return 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
    