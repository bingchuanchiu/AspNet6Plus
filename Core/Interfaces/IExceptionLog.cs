using System;

namespace Core.Interfaces
{
    public interface IExceptionLog : IDisposable 
    {
        public void ExceptionLogger(int uid, Exception ex);
    }
}
