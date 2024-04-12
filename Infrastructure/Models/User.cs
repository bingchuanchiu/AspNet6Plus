using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class User
    {
        public User()
        {
            ConfirmatonCodes = new HashSet<ConfirmatonCode>();
            Passwords = new HashSet<Password>();
            UserAssignedCellCarriers = new HashSet<UserAssignedCellCarrier>();
            UserAssignedGroups = new HashSet<UserAssignedGroup>();
            UserOus = new HashSet<UserOu>();
        }

        public int UserId { get; set; }
        public int? UserTypeId { get; set; }
        public string Username { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Emplid { get; set; }
        public string Email { get; set; }
        public bool? EmailNotifications { get; set; }
        public string Thumbnail { get; set; }
        public DateTime? LdapWhenChanged { get; set; }
        public DateTime? LdapWhenCreated { get; set; }
        public bool? IsDisabled { get; set; }
        public int? LockoutTime { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<ConfirmatonCode> ConfirmatonCodes { get; set; }
        public virtual ICollection<Password> Passwords { get; set; }
        public virtual ICollection<UserAssignedCellCarrier> UserAssignedCellCarriers { get; set; }
        public virtual ICollection<UserAssignedGroup> UserAssignedGroups { get; set; }
        public virtual ICollection<UserOu> UserOus { get; set; }
    }
}
