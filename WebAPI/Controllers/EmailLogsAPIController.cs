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
    public class EmailLogsAPIController : ControllerBase, IEntityAPIControllerBase<EmailLog>
    {
        private readonly IEntityAPIController<EmailLog> _controllerService;    

        public EmailLogsAPIController()
        {
            _controllerService = new SEntityAPIController<EmailLog>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EmailLog>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x=>x.EmailLogId).ToListAsync();
        }

        // GET: api/EmailLogAPI/5
        //[HttpGet("{id}")]
        public async Task<ActionResult<EmailLog>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/EmailLogAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, EmailLog TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/EmailLogAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        public async Task<int> PostEntity(EmailLog TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.EmailTo.ToString(), TEntity.EmailSubject.ToString(), TEntity.EmailBody.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.EmailTo.ToString(), TEntity.EmailSubject.ToString(), TEntity.EmailBody.ToString());
            }
                        
            return temp;
        }

        // DELETE: api/EmailLogAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.EmailTo.ToString() == NoDupKey1 && x.EmailSubject.ToString() == NoDupKey2 && x.EmailBody.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.EmailTo.ToString() == NoDupKey1 && x.EmailSubject.ToString() == NoDupKey2 && x.EmailBody.ToString() == NoDupKey3).OrderBy(y=>y.EmailLogId).Select(x => x.EmailLogId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
    