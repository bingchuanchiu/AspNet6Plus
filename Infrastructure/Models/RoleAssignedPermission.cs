using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class RoleAssignedPermission
    {
        public int RoleAssignedPermissionId { get; set; }
        public int PermissionId { get; set; }
        public int RoleId { get; set; }

        public virtual Permission Permission { get; set; }
        public virtual Role Role { get; set; }
    }
}
