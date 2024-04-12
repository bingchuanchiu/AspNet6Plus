using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class GroupAssignedOu
    {
        public int GroupAssignedOuId { get; set; }
        public int GroupId { get; set; }
        public int OuId { get; set; }
        public bool? Active { get; set; }

        public virtual Group Group { get; set; }
        public virtual Ou Ou { get; set; }
    }
}
