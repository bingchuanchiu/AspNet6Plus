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
    public class InvoiceStatusTypesAPIController : ControllerBase, IEntityAPIControllerBase<InvoiceStatusType>
    {
        private readonly IEntityAPIController<InvoiceStatusType> _controllerService;
        
        public InvoiceStatusTypesAPIController()
        {            
            _controllerService = new SEntityAPIController<InvoiceStatusType>();
        }


        //ODATA Test:http://localhost:5000/api/InvoiceStatusTypesAPI/?$filter=InvoiceStatusTypeId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/InvoiceStatusTypesAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InvoiceStatusType>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.InvoiceStatusTypeId).ToListAsync();
        }

        // GET: api/InvoiceStatusTypesAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InvoiceStatusType>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/InvoiceStatusTypesAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, InvoiceStatusType TEntity)
        {

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/InvoiceStatusTypesAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(InvoiceStatusType TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.InvoiceStatusTypeName);

            ControllerLogger();

            //TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.InvoiceStatusTypeName);
            }

            return temp;
        }

        // DELETE: api/InvoiceStatusTypesAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.InvoiceStatusTypeName == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.InvoiceStatusTypeName == NoDupKey1).OrderBy(y => y.InvoiceStatusTypeId).Select(x => x.InvoiceStatusTypeId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
