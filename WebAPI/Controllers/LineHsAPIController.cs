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
    public class LineHsAPIController : ControllerBase, IEntityAPIControllerBase<LineH>
    {
        private readonly IEntityAPIController<LineH> _controllerService;
        
        public LineHsAPIController()
        {            
            _controllerService = new SEntityAPIController<LineH>();
        }


        //ODATA Test:http://localhost:5000/api/LineHsAPI/?$filter=LineHId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/LineHsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<LineH>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.LineHId).ToListAsync();
        }

        // GET: api/LineHsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<LineH>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/LineHsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, LineH TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/LineHsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(LineH TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.LineHName);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.LineHName);
            }

            return temp;
        }

        // DELETE: api/LineHsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.LineHName == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.LineHName == NoDupKey1).OrderBy(y => y.LineHId).Select(x => x.LineHId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
