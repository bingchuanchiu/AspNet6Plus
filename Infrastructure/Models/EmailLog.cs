using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class EmailLog
    {
        public int EmailLogId { get; set; }
        public string EmailFrom { get; set; }
        public string EmailTo { get; set; }
        public string EmailCc { get; set; }
        public string EmailBcc { get; set; }
        public string EmailSubject { get; set; }
        public string EmailBody { get; set; }
        public byte[] EmailAttachment { get; set; }
        public DateTime CreatedAt { get; set; }
        public int CreatedBy { get; set; }
    }
}
