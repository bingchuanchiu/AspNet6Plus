using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net; //Test_SendEmail()
using System.Net.Mail; //Test_SendEmail()
//using Core.Interfaces;
using System.Threading.Tasks;
using Infrastructure.Interfaces;
using Infrastructure.Repositories;

namespace Infrastructure.Services
{
    public class SEmail: IEmail
    {
        private bool disposedValue;
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        private string SMTPHost { get; set; }
        private int SMTPPort { get; set; }
        private string SMTPFrom { get; set; } //DoNotReply + Application Name + domain

        public SEmail()
        {
            /*
             * SET THE ABOVE SETTINGS HERE. THE SETTINGS SHOULD BE RETRIEVED FROM THE SETTINGS DB
             */
            SMTPHost = getSettingsValue("smtp_host");
            int.TryParse(getSettingsValue("smtp_port"), out int temp) ;
            SMTPPort = temp > 0 ? temp : 0;
            SMTPFrom = getSettingsValue("smtp_from");
        }

        protected string getSettingsValue(string key)
        {
            return _DBContext.Settings.AsQueryable().Where(x=>x.SettingName == key).Select(x=>x.Value)?.FirstOrDefault()?.ToString();
        }

        public bool SendEmail(string to, string subject, string message, string cc = null, string bcc = null)
        {
            bool temp = false;

            using (MailMessage mail = new MailMessage(SMTPFrom, to))
            {
                mail.Subject = subject;
                mail.Body = message;
                if (cc != null) { mail.CC.Add(cc); }
                if (bcc != null) { mail.Bcc.Add(bcc); }

                SmtpClient smtp = new SmtpClient();
                smtp.Host = SMTPHost;
                smtp.Port = SMTPPort;
                smtp.UseDefaultCredentials = true;

                smtp.Send(mail);

                temp = true;
            }

            return temp;
        }

        public bool SendEmailList(List<string> toList, string subject, string message)
        {
            bool temp = false;

            foreach (string to in toList)
            {
                using (MailMessage mail = new MailMessage(SMTPFrom, to))
                {
                    mail.Subject = subject;
                    mail.Body = message;
                    // mail.CC.Add(cc);
                    // mail.Bcc.Add(bcc);

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = SMTPHost;
                    smtp.Port = SMTPPort;
                    smtp.UseDefaultCredentials = true;

                    smtp.Send(mail);

                    temp = true;
                }
            }

            return temp;

        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                    _DBContext = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

    }
}
