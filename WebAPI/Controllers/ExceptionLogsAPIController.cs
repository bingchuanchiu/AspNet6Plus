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
    public class ExceptionLogsAPIController : ControllerBase, IEntityAPIControllerBase<ExceptionLog>
    {
        private readonly IEntityAPIController<ExceptionLog> _controllerService;    

        public ExceptionLogsAPIController()
        {
            _controllerService = new SEntityAPIController<ExceptionLog>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ExceptionLog>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x=>x.ExceptionLogId).ToListAsync();
        }

        // GET: api/ExceptionLogAPI/5
        //[HttpGet("{id}")]
        public async Task<ActionResult<ExceptionLog>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ExceptionLogAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, ExceptionLog TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ExceptionLogAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        public async Task<int> PostEntity(ExceptionLog TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.Message.ToString(), TEntity.InnerException.ToString(), TEntity.StackTrace.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.Message.ToString(), TEntity.InnerException.ToString(), TEntity.StackTrace.ToString());
            }
                        
            return temp;
        }

        // DELETE: api/ExceptionLogAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.Message.ToString() == NoDupKey1 && x.InnerException.ToString() == NoDupKey2 && x.StackTrace.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.Message.ToString() == NoDupKey1 && x.InnerException.ToString() == NoDupKey2 && x.StackTrace.ToString() == NoDupKey3).OrderBy(y=>y.ExceptionLogId).Select(x => x.ExceptionLogId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
    