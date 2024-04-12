using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class UserAssignedCellCarrier
    {
        public int UserAssignedCellCarrierId { get; set; }
        public int UserId { get; set; }
        public int CellCarrierId { get; set; }
        public string Cellphone { get; set; }
        public bool? Active { get; set; }

        public virtual CellCarrier CellCarrier { get; set; }
        public virtual User User { get; set; }
    }
}
