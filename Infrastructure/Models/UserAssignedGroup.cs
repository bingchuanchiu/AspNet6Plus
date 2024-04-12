using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class UserAssignedGroup
    {
        public int UserAssignedGroupId { get; set; }
        public int UserId { get; set; }
        public int GroupId { get; set; }

        public virtual Group Group { get; set; }
        public virtual User User { get; set; }
    }
}
