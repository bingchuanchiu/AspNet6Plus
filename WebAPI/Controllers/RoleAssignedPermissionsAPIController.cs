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
    public class RoleAssignedPermissionsAPIController : ControllerBase, IEntityAPIControllerBase<RoleAssignedPermission>
    {
        private readonly IEntityAPIController<RoleAssignedPermission> _controllerService;    

        public RoleAssignedPermissionsAPIController()
        {
            _controllerService = new SEntityAPIController<RoleAssignedPermission>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoleAssignedPermission>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.RoleAssignedPermissionId).ToListAsync();
        }

        // GET: api/RoleAssignedPermissionsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RoleAssignedPermission>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/RoleAssignedPermissionsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, RoleAssignedPermission TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/RoleAssignedPermissionsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(RoleAssignedPermission TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.RoleId.ToString(), TEntity.PermissionId.ToString());

            ControllerLogger();

            //TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.RoleId.ToString(), TEntity.PermissionId.ToString());
            }
                        
            return temp;
        }

        // DELETE: api/RoleAssignedPermissionsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.RoleId.ToString() == NoDupKey1 && x.PermissionId.ToString() == NoDupKey2);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.RoleId.ToString() == NoDupKey1 && x.PermissionId.ToString() == NoDupKey2).OrderBy(y=>y.RoleAssignedPermissionId).Select(x => x.RoleAssignedPermissionId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
    