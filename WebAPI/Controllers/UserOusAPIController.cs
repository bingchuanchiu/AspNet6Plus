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

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserOusAPIController : ControllerBase, IEntityAPIControllerBase<UserOu>
    {
        private readonly IEntityAPIController<UserOu> _controllerService;

        public UserOusAPIController()
        {            
            _controllerService = new SEntityAPIController<UserOu>();
        }

        [EnableQuery()]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserOu>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.UserOuId).ToListAsync();
        }

        // GET: api/UserOusAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserOu>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/UserOusAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, UserOu TEntity)
        {
           // TEntity.UpdatedAt = DateTime.Now;
           // TEntity.UpdatedBy = SLoggedInUser.userID ;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/UserOusAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(UserOu TEntity)
        {
            int temp = 0;
            var dupCheck = DupCheck(TEntity.OuName);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
           // TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.OuName);
            }
                        
            return temp;
        }

        // DELETE: api/UserOusAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.OuName == NoDupKey1);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.OuName == NoDupKey1).OrderBy(y => y.UserOuId).Select(x => x.UserOuId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {
            _controllerService.ControllerLogger(Request);
        }
    }
}
