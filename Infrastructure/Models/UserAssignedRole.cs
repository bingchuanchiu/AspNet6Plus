using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class UserAssignedRole
    {
        public int UserAssignedRoleId { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }

        public virtual Role Role { get; set; }
    }
}
