﻿using System.Collections.Generic;
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
    public class LineHdocumentsAPIController : ControllerBase, IEntityAPIControllerBase<LineHdocument>
    {
        private readonly IEntityAPIController<LineHdocument> _controllerService;
        
        public LineHdocumentsAPIController()
        {            
            _controllerService = new SEntityAPIController<LineHdocument>();
        }


        //ODATA Test:http://localhost:5000/api/LineHdocumentsAPI/?$filter=LineHdocumentId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/LineHdocumentsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<LineHdocument>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.LineHDocumentId).ToListAsync();
        }

        // GET: api/LineHdocumentsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<LineHdocument>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/LineHdocumentsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, LineHdocument TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/LineHdocumentsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(LineHdocument TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.FileName, TEntity.FileType, TEntity.FileSize);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.FileName, TEntity.FileType, TEntity.FileSize);
            }

            return temp;
        }

        // DELETE: api/LineHdocumentsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.FileName == NoDupKey1 && x.FileType == NoDupKey2 && x.FileSize == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.FileName == NoDupKey1 && x.FileType == NoDupKey2 && x.FileSize == NoDupKey3).OrderBy(y => y.LineHDocumentId).Select(x => x.LineHDocumentId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
