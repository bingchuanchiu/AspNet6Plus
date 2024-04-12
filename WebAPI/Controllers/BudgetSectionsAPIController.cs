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
using Core.Static;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BudgetSectionsAPIController : ControllerBase, IEntityAPIControllerBase<BudgetSection>
    {
        private readonly IEntityAPIController<BudgetSection> _controllerService;
        
        public BudgetSectionsAPIController()
        {            
            _controllerService = new SEntityAPIController<BudgetSection>();
        }

        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BudgetSection>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.BudgetSectionId).ToListAsync();
        }

        // GET: api/BudgetSectionsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BudgetSection>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/BudgetSectionsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, BudgetSection TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/BudgetSectionsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(BudgetSection TEntity)
        {
            int temp = 0;
            var dupCheck = DupCheck(TEntity.ContractsSectionId?.ToString(), TEntity.BudgetSectionSubmitsFundsApprovalDate?.ToString(), TEntity.BudgetSectionReceivesFundsApprovalDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.ContractsSectionId?.ToString(), TEntity.BudgetSectionSubmitsFundsApprovalDate?.ToString(), TEntity.BudgetSectionReceivesFundsApprovalDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/BudgetSectionsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.ContractsSectionId.ToString() == NoDupKey1 && x.BudgetSectionSubmitsFundsApprovalDate.ToString() == NoDupKey2 && x.BudgetSectionReceivesFundsApprovalDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.ContractsSectionId.ToString() == NoDupKey1 && x.BudgetSectionSubmitsFundsApprovalDate.ToString() == NoDupKey2 && x.BudgetSectionReceivesFundsApprovalDate.ToString() == NoDupKey3).OrderBy(y => y.BudgetSectionId).Select(x => x.BudgetSectionId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
