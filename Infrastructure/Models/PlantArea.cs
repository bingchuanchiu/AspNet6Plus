using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class PlantArea
    {
        public int PlantAreaId { get; set; }
        public int PlantId { get; set; }
        public string PlantAreaName { get; set; }

        public virtual Plant Plant { get; set; }
    }
}
