using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class GroupAssignedRole
    {
        public int GroupAssignedRoleId { get; set; }
        public int GroupId { get; set; }
        public int RoleId { get; set; }

        public virtual Group Group { get; set; }
        public virtual Role Role { get; set; }
    }
}
