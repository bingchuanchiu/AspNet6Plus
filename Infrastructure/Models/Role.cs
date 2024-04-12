using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Role
    {
        public Role()
        {
            GroupAssignedRoles = new HashSet<GroupAssignedRole>();
            OuassignedRoles = new HashSet<OuassignedRole>();
            RoleAssignedPermissions = new HashSet<RoleAssignedPermission>();
            UserAssignedRoles = new HashSet<UserAssignedRole>();
        }

        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public int? CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }

        public virtual ICollection<GroupAssignedRole> GroupAssignedRoles { get; set; }
        public virtual ICollection<OuassignedRole> OuassignedRoles { get; set; }
        public virtual ICollection<RoleAssignedPermission> RoleAssignedPermissions { get; set; }
        public virtual ICollection<UserAssignedRole> UserAssignedRoles { get; set; }
    }
}
