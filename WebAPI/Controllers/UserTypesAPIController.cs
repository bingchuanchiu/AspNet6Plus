using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Core.Services;
using Infrastructure.Models;

using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserTypesAPIController : ControllerBase, IEntityAPIControllerBase<UserType>
    {
        private readonly IEntityAPIController<UserType> _controllerService;    

        public UserTypesAPIController()
        {
            _controllerService = new SEntityAPIController<UserType>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserType>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.UserTypeId).ToListAsync();
        }

        // GET: api/UserTypesAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserType>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/UserTypesAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, UserType TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/UserTypesAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(UserType TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.UserTypeName);

            ControllerLogger();

           // TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.UserTypeName);
            }
                        
            return temp;
        }

        // DELETE: api/UserTypesAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.UserTypeName == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.UserTypeName == NoDupKey1).OrderBy(y=>y.UserTypeId).Select(x => x.UserTypeId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
    