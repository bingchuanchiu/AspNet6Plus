using System;

namespace Core.Interfaces
{
    public interface IUserLog : IDisposable
    {
        public void UserLogger(int uid, string controller, string action, string msg = null);
    }
}
