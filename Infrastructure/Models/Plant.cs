using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class Plant
    {
        public Plant()
        {
            PlantAreas = new HashSet<PlantArea>();
        }

        public int PlantId { get; set; }
        public string PlantName { get; set; }
        public double Heading { get; set; }
        public double Height { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public double Pitch { get; set; }
        public double Roll { get; set; }
        public int PlantNumber { get; set; }
        public string Address { get; set; }
        public int? HopperSize { get; set; }
        public bool IsDewatering { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<PlantArea> PlantAreas { get; set; }
    }
}
