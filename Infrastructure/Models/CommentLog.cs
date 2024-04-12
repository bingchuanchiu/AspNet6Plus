using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class CommentLog
    {
        public int CommentLogId { get; set; }
        public int CmSectionId { get; set; }
        public string Comment { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }

        public virtual CmSection CmSection { get; set; }
    }
}
