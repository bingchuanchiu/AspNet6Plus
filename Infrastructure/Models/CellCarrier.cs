using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class CellCarrier
    {
        public CellCarrier()
        {
            UserAssignedCellCarriers = new HashSet<UserAssignedCellCarrier>();
        }

        public int CellCarrierId { get; set; }
        public string CellCarrierName { get; set; }
        public string SmsGateway { get; set; }
        public bool? SmsNotifications { get; set; }

        public virtual ICollection<UserAssignedCellCarrier> UserAssignedCellCarriers { get; set; }
    }
}
