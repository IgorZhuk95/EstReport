namespace EstReport.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Estate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Estate()
        {
            Reports = new HashSet<Report>();
        }

        public Guid Id { get; set; }

        public Guid AddressId { get; set; }

        public Guid TypeId { get; set; }

        public decimal? Square { get; set; }

        public decimal? Price { get; set; }

        public string EstateOwner { get; set; }

        public virtual Address Address { get; set; }

        public virtual EstateType EstateType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Report> Reports { get; set; }
    }
}
