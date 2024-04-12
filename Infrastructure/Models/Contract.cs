using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Contract
    {
        public Contract()
        {
            JobOrders = new HashSet<JobOrder>();
        }

        public int ContractId { get; set; }
        public int ContractorId { get; set; }
        public string ContractNumber { get; set; }
        public string ContractRegistrationNumber { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual Contractor Contractor { get; set; }
        public virtual ICollection<JobOrder> JobOrders { get; set; }
    }
}
