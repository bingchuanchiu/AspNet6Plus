using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class ConfirmatonCode
    {
        public int ConfirmationCodeId { get; set; }
        public int UserId { get; set; }
        public string Type { get; set; }
        public string Code { get; set; }
        public string Url { get; set; }
        public DateTime CreatedAt { get; set; }

        public virtual User User { get; set; }
    }
}
