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
    public class UserAssignedCellCarriersAPIController : ControllerBase, IEntityAPIControllerBase<UserAssignedCellCarrier>
    {
        private readonly IEntityAPIController<UserAssignedCellCarrier> _controllerService;

        public UserAssignedCellCarriersAPIController()
        {            
            _controllerService = new SEntityAPIController<UserAssignedCellCarrier>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserAssignedCellCarrier>>> GetEntities()
        {
            ControllerLogger();                                                  
            return await _controllerService.GetEntities().OrderByDescending(x => x.UserAssignedCellCarrierId).ToListAsync();
        }

        // GET: api/UserAssignedCellCarriersAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserAssignedCellCarrier>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/UserAssignedCellCarriersAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, UserAssignedCellCarrier TEntity)
        {
            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.UserID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/UserAssignedCellCarriersAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(UserAssignedCellCarrier TEntity)
        {
            int temp = 0;
            var dupCheck = DupCheck(TEntity.UserId.ToString(), TEntity.CellCarrierId.ToString(), TEntity.Cellphone);

            ControllerLogger();

            //TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.UserID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.UserId.ToString(), TEntity.CellCarrierId.ToString(), TEntity.Cellphone);
            }
                        
            return temp;
        }

        // DELETE: api/UserAssignedCellCarriersAPI/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.DeleteEntity(ID);
        }

        /*
        * USE THE # OF FIELDS THAT MAKES SENSE TO THE MODEL
        * FOR DupCheck AND GetID  TEntity.UserId.ToString(), TEntity.CellCarrierId.ToString(), TEntity.Cellphone
        */

        public bool DupCheck(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.UserId.ToString() == NoDupKey1 && x.CellCarrierId.ToString() == NoDupKey2 && x.Cellphone == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.UserId.ToString() == NoDupKey1 && x.CellCarrierId.ToString() == NoDupKey2 && x.Cellphone == NoDupKey3).OrderBy(y => y.UserAssignedCellCarrierId).Select(x => x.UserAssignedCellCarrierId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
