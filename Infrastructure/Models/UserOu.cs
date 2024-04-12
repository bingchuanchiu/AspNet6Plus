using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class UserOu
    {
        public int UserOuId { get; set; }
        public string OuName { get; set; }
        public int UserId { get; set; }
        public DateTime? CreatedAt { get; set; }

        public virtual User User { get; set; }
    }
}
