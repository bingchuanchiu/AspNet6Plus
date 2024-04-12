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
    public class ContractsSectionsAPIController : ControllerBase, IEntityAPIControllerBase<ContractsSection>
    {
        private readonly IEntityAPIController<ContractsSection> _controllerService;
        
        public ContractsSectionsAPIController()
        {            
            _controllerService = new SEntityAPIController<ContractsSection>();
        }


        //ODATA Test:http://localhost:5000/api/ContractsSectionsAPI/?$filter=ContractsSectionId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/ContractsSectionsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ContractsSection>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.ContractsSectionId).ToListAsync();
        }

        // GET: api/ContractsSectionsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ContractsSection>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ContractsSectionsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, ContractsSection TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ContractsSectionsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(ContractsSection TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.DipReceivedDate?.ToString(), TEntity.NotificationSentJoctocDate?.ToString(), TEntity.ContractorSubmittedUpdatedDocumentsDipDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.DipReceivedDate?.ToString(), TEntity.NotificationSentJoctocDate?.ToString(), TEntity.ContractorSubmittedUpdatedDocumentsDipDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/ContractsSectionsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.DipReceivedDate.ToString() == NoDupKey1 && x.NotificationSentJoctocDate.ToString() == NoDupKey2 && x.ContractorSubmittedUpdatedDocumentsDipDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.DipReceivedDate.ToString() == NoDupKey1 && x.NotificationSentJoctocDate.ToString() == NoDupKey2 && x.ContractorSubmittedUpdatedDocumentsDipDate.ToString() == NoDupKey3).OrderBy(y => y.ContractsSectionId).Select(x => x.ContractsSectionId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
