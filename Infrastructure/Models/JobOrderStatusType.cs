using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class JobOrderStatusType
    {
        public JobOrderStatusType()
        {
            JobOrders = new HashSet<JobOrder>();
        }

        public int JobOrderStatusTypeId { get; set; }
        public string JobOrderStatusTypeName { get; set; }

        public virtual ICollection<JobOrder> JobOrders { get; set; }
    }
}
