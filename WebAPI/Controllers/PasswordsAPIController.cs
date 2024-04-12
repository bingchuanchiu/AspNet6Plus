using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Core.Services;
using Infrastructure.Models;

using System;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PasswordsAPIController : ControllerBase, IEntityAPIControllerBase<Password>
    {
        private readonly IEntityAPIController<Password> _controllerService;    

        public PasswordsAPIController()
        {
            _controllerService = new SEntityAPIController<Password>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Password>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.PasswordId).ToListAsync();
        }

        // GET: api/PasswordsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Password>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/PasswordsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, Password TEntity)
        { 

            TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/PasswordsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(Password TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.UserId.ToString(), TEntity.PasswordSecret);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.UserId.ToString(), TEntity.PasswordSecret);
            }
                        
            return temp;
        }

        // DELETE: api/PasswordsAPI/5
        [HttpDelete("{id}")]
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
            var temp = _controllerService._DBSet.Where(x => x.UserId.ToString() == NoDupKey1 && x.PasswordSecret == NoDupKey2);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.UserId.ToString() == NoDupKey1 && x.PasswordSecret == NoDupKey2).OrderBy(y=>y.PasswordId).Select(x => x.PasswordId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
    