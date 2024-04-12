using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class GroupType
    {
        public GroupType()
        {
            Groups = new HashSet<Group>();
        }

        public int GroupTypeId { get; set; }
        public string GroupTypeName { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Group> Groups { get; set; }
    }
}
