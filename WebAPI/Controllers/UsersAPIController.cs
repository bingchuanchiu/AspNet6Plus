using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Core.Services;
using Infrastructure.Models;

using System;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using Core.Static;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersAPIController : ControllerBase, IEntityAPIControllerBase<User>
    {
        private readonly IEntityAPIController<User> _controllerService;

        public UsersAPIController()
        {            
            _controllerService = new SEntityAPIController<User>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.UserId).ToListAsync();
        }

        // GET: api/UsersAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/UsersAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, User TEntity)
        {
            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/UsersAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(User TEntity)
        {
            int temp = 0;
            var dupCheck = DupCheck(TEntity.Username);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.Username);
            }
                        
            return temp;
        }

        // DELETE: api/UsersAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.Username == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.Username == NoDupKey1).OrderBy(y => y.UserId).Select(x => x.UserId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
