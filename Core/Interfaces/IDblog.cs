using System;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IDblog<TEntity> : IDisposable where TEntity : class
    {
        public Task<bool> DatabaseLogger(int uid, TEntity TEntityOld, TEntity TEntityNew);

    }
}
