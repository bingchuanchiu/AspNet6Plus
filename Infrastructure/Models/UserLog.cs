using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class UserLog
    {
        public int UserLogId { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string UserAgent { get; set; }
        public string UrlCurrent { get; set; }
        public string UrlReferral { get; set; }
        public string ClientIp { get; set; }
        public string Message { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
    }
}
