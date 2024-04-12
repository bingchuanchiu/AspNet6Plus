using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Group
    {
        public Group()
        {
            GroupAssignedOus = new HashSet<GroupAssignedOu>();
            GroupAssignedRoles = new HashSet<GroupAssignedRole>();
            UserAssignedGroups = new HashSet<UserAssignedGroup>();
        }

        public int GroupId { get; set; }
        public int GroupTypeId { get; set; }
        public string GroupName { get; set; }
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public bool? EmailNotifications { get; set; }
        public bool? SmsNotifications { get; set; }
        public bool? Enabled { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }

        public virtual GroupType GroupType { get; set; }
        public virtual ICollection<GroupAssignedOu> GroupAssignedOus { get; set; }
        public virtual ICollection<GroupAssignedRole> GroupAssignedRoles { get; set; }
        public virtual ICollection<UserAssignedGroup> UserAssignedGroups { get; set; }
    }
}
