using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IAuthorization : IDisposable        
    {
        public List<string> permissions { get; set; }
        public List<string> InitAuthorizations(string username);        

    }
}
