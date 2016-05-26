namespace EstReport.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Reports = new HashSet<Report>();
        }

        public Guid Id { get; set; }

        [StringLength(256)]
        public string Name { get; set; }

        [Required]
        [StringLength(256)]
        public string Mail { get; set; }

        [Required]
        [StringLength(256)]
        public string Password { get; set; }

        public Guid RoleId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Report> Reports { get; set; }

        public virtual Role Role { get; set; }
    }
}
