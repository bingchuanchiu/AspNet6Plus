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
    public class CmSectionsAPIController : ControllerBase, IEntityAPIControllerBase<CmSection>
    {
        private readonly IEntityAPIController<CmSection> _controllerService;
        
        public CmSectionsAPIController()
        {            
            _controllerService = new SEntityAPIController<CmSection>();
        }


        //ODATA Test:http://localhost:5000/api/CmSectionsAPI/?$filter=CmSectionId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/CmSectionsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CmSection>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.CmSectionId).ToListAsync();
        }

        // GET: api/CmSectionsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CmSection>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/CmSectionsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, CmSection TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/CmSectionsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(CmSection TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.CmConsultantId.ToString(), TEntity.CmConsultantReceivesPencilCopyDate?.ToString(), TEntity.CmConsultantApprovesPencilCopyDate?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.CmConsultantId.ToString(), TEntity.CmConsultantReceivesPencilCopyDate?.ToString(), TEntity.CmConsultantApprovesPencilCopyDate?.ToString());
            }

            return temp;
        }

        // DELETE: api/CmSectionsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.CmConsultantId.ToString() == NoDupKey1 && x.CmConsultantReceivesPencilCopyDate.ToString() == NoDupKey2 && x.CmConsultantApprovesPencilCopyDate.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.CmConsultantId.ToString() == NoDupKey1 && x.CmConsultantReceivesPencilCopyDate.ToString() == NoDupKey2 && x.CmConsultantApprovesPencilCopyDate.ToString() == NoDupKey3).OrderBy(y => y.CmSectionId).Select(x => x.CmSectionId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
