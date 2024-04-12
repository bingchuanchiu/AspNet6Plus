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
    public class ReturnedToSectionsAPIController : ControllerBase, IEntityAPIControllerBase<ReturnedToSection>
    {
        private readonly IEntityAPIController<ReturnedToSection> _controllerService;
        
        public ReturnedToSectionsAPIController()
        {            
            _controllerService = new SEntityAPIController<ReturnedToSection>();
        }


        //ODATA Test:http://localhost:5000/api/ReturnedToSectionsAPI/?$filter=ReturnedToSectionId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/ReturnedToSectionsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ReturnedToSection>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.ReturnedToSectionId).ToListAsync();
        }

        // GET: api/ReturnedToSectionsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ReturnedToSection>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ReturnedToSectionsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, ReturnedToSection TEntity)
        {

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ReturnedToSectionsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(ReturnedToSection TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.CurrentSectionId?.ToString(), TEntity.ReturnedFromSectionId?.ToString(), TEntity.ReturnedDesdinationSectionId?.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.CurrentSectionId?.ToString(), TEntity.ReturnedFromSectionId?.ToString(), TEntity.ReturnedDesdinationSectionId?.ToString());
            }

            return temp;
        }

        // DELETE: api/ReturnedToSectionsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.CurrentSectionId.ToString() == NoDupKey1 && x.ReturnedFromSectionId.ToString() == NoDupKey2 && x.ReturnedDesdinationSectionId.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.CurrentSectionId.ToString() == NoDupKey1 && x.ReturnedFromSectionId.ToString() == NoDupKey2 && x.ReturnedDesdinationSectionId.ToString() == NoDupKey3).OrderBy(y => y.ReturnedToSectionId).Select(x => x.ReturnedToSectionId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
