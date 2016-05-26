namespace EstReport.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Address")]
    public partial class Address
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Address()
        {
            Estates = new HashSet<Estate>();
        }

        public Guid Id { get; set; }

        [StringLength(256)]
        public string Region { get; set; }

        [StringLength(256)]
        public string City { get; set; }

        [StringLength(256)]
        public string Street { get; set; }

        [StringLength(256)]
        public string HouseNumber { get; set; }

        [StringLength(256)]
        public string FlatNumber { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Estate> Estates { get; set; }
    }
}
