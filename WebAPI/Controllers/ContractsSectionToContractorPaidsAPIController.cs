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
    public class ContractsSectionToContractorPaidsAPIController : ControllerBase, IEntityAPIControllerBase<ContractsSectionToContractorPaid>
    {
        private readonly IEntityAPIController<ContractsSectionToContractorPaid> _controllerService;
        
        public ContractsSectionToContractorPaidsAPIController()
        {            
            _controllerService = new SEntityAPIController<ContractsSectionToContractorPaid>();
        }


        //ODATA Test:http://localhost:5000/api/ContractsSectionToContractorPaidsAPI/?$filter=ContractsSectionToContractorPaidId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/ContractsSectionToContractorPaidsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ContractsSectionToContractorPaid>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.ContractsSectionToContractorPaidId).ToListAsync();
        }

        // GET: api/ContractsSectionToContractorPaidsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ContractsSectionToContractorPaid>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ContractsSectionToContractorPaidsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, ContractsSectionToContractorPaid TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ContractsSectionToContractorPaidsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(ContractsSectionToContractorPaid TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.JocTocSection2Id?.ToString(), TEntity.RecievesMonthlyRequisitionJoctocSectionDate?.ToString(), TEntity.SubmitsRequisitionAccoOfficeDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.JocTocSection2Id?.ToString(), TEntity.RecievesMonthlyRequisitionJoctocSectionDate?.ToString(), TEntity.SubmitsRequisitionAccoOfficeDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/ContractsSectionToContractorPaidsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.JocTocSection2Id.ToString() == NoDupKey1 && x.RecievesMonthlyRequisitionJoctocSectionDate.ToString() == NoDupKey2 && x.SubmitsRequisitionAccoOfficeDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.JocTocSection2Id.ToString() == NoDupKey1 && x.RecievesMonthlyRequisitionJoctocSectionDate.ToString() == NoDupKey2 && x.SubmitsRequisitionAccoOfficeDate.ToString() == NoDupKey3).OrderBy(y => y.ContractsSectionToContractorPaidId).Select(x => x.ContractsSectionToContractorPaidId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
