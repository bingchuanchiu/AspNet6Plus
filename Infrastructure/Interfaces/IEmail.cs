using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Infrastructure.Interfaces
{
    public interface IEmail : IDisposable
    {
        public bool SendEmail(string to, string subject, string message, string cc = null, string bcc = null);

        public bool SendEmailList(List<string> toList, string subject, string message);
    }
}
