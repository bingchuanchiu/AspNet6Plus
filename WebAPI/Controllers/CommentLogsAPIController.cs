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
    public class CommentLogsAPIController : ControllerBase, IEntityAPIControllerBase<CommentLog>
    {
        private readonly IEntityAPIController<CommentLog> _controllerService;
        
        public CommentLogsAPIController()
        {            
            _controllerService = new SEntityAPIController<CommentLog>();
        }


        //ODATA Test:http://localhost:5000/api/CommentLogsAPI/?$filter=CommentLogId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/CommentLogsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CommentLog>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.CommentLogId).ToListAsync();
        }

        // GET: api/CommentLogsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CommentLog>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/CommentLogsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, CommentLog TEntity)
        {

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/CommentLogsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(CommentLog TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.CmSectionId.ToString(), TEntity.Comment);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.CmSectionId.ToString(), TEntity.Comment);
            }

            return temp;
        }

        // DELETE: api/CommentLogsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.CmSectionId.ToString() == NoDupKey1 && x.Comment == NoDupKey2);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.CmSectionId.ToString() == NoDupKey1 && x.Comment == NoDupKey2).OrderBy(y => y.CommentLogId).Select(x => x.CommentLogId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
