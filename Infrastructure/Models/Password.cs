using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Password
    {
        public int PasswordId { get; set; }
        public int? UserId { get; set; }
        public string PasswordSecret { get; set; }
        public bool? NeverExpires { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual User User { get; set; }
    }
}
