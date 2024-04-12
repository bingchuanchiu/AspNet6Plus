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
    public class JocTocSections2sAPIController : ControllerBase, IEntityAPIControllerBase<JocTocSections2>
    {
        private readonly IEntityAPIController<JocTocSections2> _controllerService;
        
        public JocTocSections2sAPIController()
        {            
            _controllerService = new SEntityAPIController<JocTocSections2>();
        }


        //ODATA Test:http://localhost:5000/api/JocTocSections2sAPI/?$filter=JocTocSections2Id%20eq%2097
        //WebAPI Test:http://localhost:5000/api/JocTocSections2sAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<JocTocSections2>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.JocTocSection2Id).ToListAsync();
        }

        // GET: api/JocTocSections2sAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<JocTocSections2>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/JocTocSections2sAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, JocTocSections2 TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/JocTocSections2sAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(JocTocSections2 TEntity)
        {
            int temp = 0;
            var dupCheck = DupCheck(TEntity.ContractsSectionId?.ToString(), TEntity.PaymentReturnedDateContractorDate?.ToString(), TEntity.TransmitsMonthlyRequisitionContractsSectionDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.ContractsSectionId?.ToString(), TEntity.PaymentReturnedDateContractorDate?.ToString(), TEntity.TransmitsMonthlyRequisitionContractsSectionDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/JocTocSections2sAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.ContractsSectionId.ToString() == NoDupKey1 && x.PaymentReturnedDateContractorDate.ToString() == NoDupKey2 && x.TransmitsMonthlyRequisitionContractsSectionDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.ContractsSectionId.ToString() == NoDupKey1 && x.PaymentReturnedDateContractorDate.ToString() == NoDupKey2 && x.TransmitsMonthlyRequisitionContractsSectionDate.ToString() == NoDupKey3).OrderBy(y => y.JocTocSection2Id).Select(x => x.JocTocSection2Id);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
