using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Core.Interfaces
{
    public interface IEntityAPIControllerBase<TEntity> where TEntity : class, new()
    {
        //public Task<ActionResult<IQueryable<TEntity>>> GetODataEntities();

        public Task<ActionResult<IEnumerable<TEntity>>> GetEntities();
        
        public Task<ActionResult<TEntity>> GetEntity(int ID);

        public Task<bool> PutEntity(int ID, TEntity TEntity);

        public Task<int> PostEntity(TEntity TEntity);

        public Task<bool> DeleteEntity(int ID);

        public bool DupCheck(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null);

        public int GetID(string NoDupKey1, string NoDupKey2 = null, string NoDupKey3 = null);
        public void ControllerLogger();


    }
}
