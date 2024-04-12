using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Ou
    {
        public Ou()
        {
            GroupAssignedOus = new HashSet<GroupAssignedOu>();
            OuassignedRoles = new HashSet<OuassignedRole>();
        }

        public int OuId { get; set; }
        public string OuName { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }

        public virtual ICollection<GroupAssignedOu> GroupAssignedOus { get; set; }
        public virtual ICollection<OuassignedRole> OuassignedRoles { get; set; }
    }
}
