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
    public class JocTocSections1sAPIController : ControllerBase, IEntityAPIControllerBase<JocTocSections1>
    {
        private readonly IEntityAPIController<JocTocSections1> _controllerService;
        
        public JocTocSections1sAPIController()
        {            
            _controllerService = new SEntityAPIController<JocTocSections1>();
        }


        //ODATA Test:http://localhost:5000/api/JocTocSections1sAPI/?$filter=JocTocSections1Id%20eq%2097
        //WebAPI Test:http://localhost:5000/api/JocTocSections1sAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<JocTocSections1>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.JocTocSection1Id).ToListAsync();
        }

        // GET: api/JocTocSections1sAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<JocTocSections1>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/JocTocSections1sAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, JocTocSections1 TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/JocTocSections1sAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(JocTocSections1 TEntity)
        {

            /*
                     public int CmSectionId { get; set; }
        public DateTime? JocTocSectionReceivesPaymentRequestDate { get; set; }
        public DateTime? JocTocSectionApprovesPaymentRequestDate { get; set; }*/

            int temp = 0;
            var dupCheck = DupCheck(TEntity.CmSectionId.ToString(),TEntity.JocTocSectionReceivesPaymentRequestDate?.ToString(),TEntity.JocTocSectionApprovesPaymentRequestDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.CmSectionId.ToString(), TEntity.JocTocSectionReceivesPaymentRequestDate?.ToString(), TEntity.JocTocSectionApprovesPaymentRequestDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/JocTocSections1sAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.CmSectionId.ToString() == NoDupKey1 && x.JocTocSectionReceivesPaymentRequestDate.ToString() == NoDupKey2 && x.JocTocSectionApprovesPaymentRequestDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.CmSectionId.ToString() == NoDupKey1 && x.JocTocSectionReceivesPaymentRequestDate.ToString() == NoDupKey2 && x.JocTocSectionApprovesPaymentRequestDate.ToString() == NoDupKey3).OrderBy(y => y.JocTocSection1Id).Select(x => x.JocTocSection1Id);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
