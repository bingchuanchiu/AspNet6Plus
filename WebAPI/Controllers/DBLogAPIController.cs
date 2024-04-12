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
using System.Reflection.Metadata;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DblogAPIController : ControllerBase, IEntityAPIControllerBase<Dblog>
    {
        private readonly IEntityAPIController<Dblog> _controllerService;    

        public DblogAPIController()
        {
            _controllerService = new SEntityAPIController<Dblog>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Dblog>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x=>x.DbLogId).ToListAsync();
        }

        // GET: api/DblogAPI/5
        //[HttpGet("{id}")]
        public async Task<ActionResult<Dblog>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/DblogAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, Dblog TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/DblogAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        public async Task<int> PostEntity(Dblog TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.ColumnName.ToString(), TEntity.ColumnOldValue.ToString(), TEntity.ColumnNewValue.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.ColumnName.ToString(), TEntity.ColumnOldValue.ToString(), TEntity.ColumnNewValue.ToString());
            }
                        
            return temp;
        }

        // DELETE: api/DblogAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.ColumnName.ToString() == NoDupKey1 && x.ColumnOldValue.ToString() == NoDupKey2 && x.ColumnNewValue.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.ColumnName.ToString() == NoDupKey1 && x.ColumnOldValue.ToString() == NoDupKey2 && x.ColumnNewValue.ToString() == NoDupKey3).OrderBy(y=>y.DbLogId).Select(x => x.DbLogId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
    