﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Core.Services;
using Infrastructure.Models;

using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.OData.Query;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConfirmationCodeAPIController : ControllerBase, IEntityAPIControllerBase<ConfirmationCode>
    {
        private readonly IEntityAPIController<ConfirmationCode> _controllerService;    

        public ConfirmationCodeAPIController()
        {
            _controllerService = new SEntityAPIController<ConfirmationCode>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ConfirmationCode>>> GetEntities()
        {
            ControllerLogger();                                               
            return await _controllerService.GetEntities().OrderByDescending(x=>x.ConfirmationCodeId).ToListAsync();
        }

        // GET: api/ConfirmationCodeAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ConfirmationCode>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ConfirmationCodeAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, ConfirmationCode TEntity)
        { 

            //TEntity.UpdatedAt = DateTime.Now;
            //TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ConfirmationCodeAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(ConfirmationCode TEntity)
        {

            int temp = 0;
            bool dupCheck = DupCheck(TEntity.Type.ToString(), TEntity.Code.ToString(), TEntity.Url.ToString());

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            //TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {
                temp = GetID(TEntity.Type.ToString(), TEntity.Code.ToString(), TEntity.Url.ToString());
            }
                        
            return temp;
        }

        // DELETE: api/ConfirmationCodeAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.Type.ToString() == NoDupKey1 && x.Code.ToString() == NoDupKey2 && x.Url.ToString() == NoDupKey3);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.Type.ToString() == NoDupKey1 && x.Code.ToString() == NoDupKey2 && x.Url.ToString() == NoDupKey3).OrderBy(y=>y.ConfirmationCodeId).Select(x => x.ConfirmationCodeId);
             return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }
    }
}
    