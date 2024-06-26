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
    public class ContractsAPIController : ControllerBase, IEntityAPIControllerBase<Contract>
    {
        private readonly IEntityAPIController<Contract> _controllerService;
        
        public ContractsAPIController()
        {            
            _controllerService = new SEntityAPIController<Contract>();
        }


        //ODATA Test:http://localhost:5000/api/ContractsAPI/?$filter=ContractId%20eq%2097
        //WebAPI Test:http://localhost:5000/api/ContractsAPI 
        [EnableQuery()] 
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Contract>>> GetEntities()
        {
            ControllerLogger();
            return await _controllerService.GetEntities().OrderByDescending(x => x.ContractId).ToListAsync();
        }

        // GET: api/ContractsAPI/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Contract>> GetEntity(int ID)
        {
            ControllerLogger();
            return await _controllerService.GetEntity(ID);
        }

        // PUT: api/ContractsAPI/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<bool> PutEntity(int ID, Contract TEntity)
        {

            TEntity.UpdatedAt = DateTime.Now;
            TEntity.UpdatedBy = SLoggedInUser.userID;

            ControllerLogger();
            return await _controllerService.PutEntity(ID, TEntity);
        }

        // POST: api/ContractsAPI
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<int> PostEntity(Contract TEntity)
        {

            int temp = 0;
            var dupCheck = DupCheck(TEntity.ContractNumber, TEntity.ContractRegistrationNumber);

            ControllerLogger();

            TEntity.CreatedAt = DateTime.Now;
            TEntity.CreatedBy = SLoggedInUser.userID;

            await _controllerService.PostEntity(TEntity, dupCheck);

            if (dupCheck == false)
            {                
                temp = GetID(TEntity.ContractNumber, TEntity.ContractRegistrationNumber);
            }

            return temp;
        }

        // DELETE: api/ContractsAPI/5
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
            var temp = _controllerService._DBSet.Where(x => x.ContractNumber == NoDupKey1 && x.ContractRegistrationNumber == NoDupKey2);
            return temp.Any();
        }

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null)
        {
            var temp = _controllerService._DBSet.Where(x => x.ContractNumber == NoDupKey1 && x.ContractRegistrationNumber == NoDupKey2).OrderBy(y => y.ContractId).Select(x => x.ContractId);
            return temp.Any() ? temp.Last() : 0;
        }

        public void ControllerLogger()
        {           
            _controllerService.ControllerLogger(Request);
        }


    }
}
