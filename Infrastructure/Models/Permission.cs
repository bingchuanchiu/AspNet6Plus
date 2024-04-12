using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Permission
    {
        public Permission()
        {
            RoleAssignedPermissions = new HashSet<RoleAssignedPermission>();
        }

        public int PermissionId { get; set; }
        public string TableName { get; set; }
        public string PermissionName { get; set; }
        public string DisplayName { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual ICollection<RoleAssignedPermission> RoleAssignedPermissions { get; set; }
    }
}
