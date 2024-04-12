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
    public class JobOrderStatusTypesAPIController : ControllerBase, IEntityAPIControllerBase<JobOrderStatusType>
    {
        private readonly IEntityAPIController<JobOrderStatusType> _controllerService;
        
        public JobOrderStatusTypesAPIController()
        {            
            _controllerService = new SEntityAPIController<JobOrderStatusType>();
        }


        //ODATA Test:http://localhost:5000/api/JobOrderStatusTypesAPI/?$filter=JobOrderStatusTypeId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/JobOrderStatusTypesAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<JobOrderStatusType>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.JobOrderStatusTypeId).ToListAsync();
        }

        // GET: api/JobOrderStatusTypesAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<JobOrderStatusType>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/JobOrderStatusTypesAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, JobOrderStatusType TEntity)
        {

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/JobOrderStatusTypesAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(JobOrderStatusType TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.JobOrderStatusTypeName);

            ControllerLogger();

            //TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.JobOrderStatusTypeName);
            }

            return temp;
        }

        // DELETE: api/JobOrderStatusTypesAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.JobOrderStatusTypeName == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.JobOrderStatusTypeName == NoDupKey1).OrderBy(y => y.JobOrderStatusTypeId).Select(x => x.JobOrderStatusTypeId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
