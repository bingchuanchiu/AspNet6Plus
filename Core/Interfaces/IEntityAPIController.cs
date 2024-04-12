using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace Core.Interfaces
{
    public interface IEntityAPIController<TEntity> : IDisposable
        where TEntity : class
    {
        public DbSet<TEntity> _DBSet { get; set; }

        public DbSet<TEntity> GetEntities();

        public Task<ActionResult<TEntity>> GetEntity(int ID);

        public Task<bool> PutEntity(int ID, TEntity TEntity);

        public Task<int> PostEntity(TEntity TEntity, bool DupCheck = false);

        public Task<bool> DeleteEntity(int ID);

        public void ControllerLogger(HttpRequest httpRequest);        

    }
}
