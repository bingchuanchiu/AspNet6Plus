using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class OuassignedRole
    {
        public int OuAssignedRoleId { get; set; }
        public int? OuId { get; set; }
        public int? RoleId { get; set; }

        public virtual Ou Ou { get; set; }
        public virtual Role Role { get; set; }
    }
}
