using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class LineHdocument
    {
        public int LineHDocumentId { get; set; }
        public int LineHId { get; set; }
        public string FileName { get; set; }
        public string FileType { get; set; }
        public string FileSize { get; set; }
        public byte[] FileBinary { get; set; }
        public string FileLocation { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? RemovedAt { get; set; }
        public int? RemovedBy { get; set; }

        public virtual LineH LineH { get; set; }
    }
}
