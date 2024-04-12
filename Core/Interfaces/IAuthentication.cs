using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IAuthentication : IDisposable        
    {
        public string loggedInUser { get; set; }
        public int loggedInUserID { get; set; }
        public bool GetAuthentication(string username = null, string password = null);

    }
}
