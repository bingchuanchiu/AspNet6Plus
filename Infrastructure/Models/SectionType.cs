using System;
using System.Collections.Generic;

#nullable disable

namespace Infrastructure.Models
{
    public partial class SectionType
    {
        public SectionType()
        {
            ReturnedToSectionCurrentSections = new HashSet<ReturnedToSection>();
            ReturnedToSectionReturnedDesdinationSections = new HashSet<ReturnedToSection>();
            ReturnedToSectionReturnedFromSections = new HashSet<ReturnedToSection>();
        }

        public int SectionTypeId { get; set; }
        public string SectionTypeName { get; set; }

        public virtual ICollection<ReturnedToSection> ReturnedToSectionCurrentSections { get; set; }
        public virtual ICollection<ReturnedToSection> ReturnedToSectionReturnedDesdinationSections { get; set; }
        public virtual ICollection<ReturnedToSection> ReturnedToSectionReturnedFromSections { get; set; }
    }
}
