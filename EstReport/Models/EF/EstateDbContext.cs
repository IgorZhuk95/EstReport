namespace EstReport.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EstateDbContext : DbContext
    {
        public EstateDbContext()
            : base("name=EstateDb")
        {
        }

        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Estate> Estates { get; set; }
        public virtual DbSet<EstateType> EstateTypes { get; set; }
        public virtual DbSet<EvaluationType> EvaluationTypes { get; set; }
        public virtual DbSet<Report> Reports { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Address>()
                .HasMany(e => e.Estates)
                .WithRequired(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estate>()
                .HasMany(e => e.Reports)
                .WithRequired(e => e.Estate)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EstateType>()
                .HasMany(e => e.Estates)
                .WithRequired(e => e.EstateType)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EvaluationType>()
                .HasMany(e => e.Reports)
                .WithRequired(e => e.EvaluationType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Report>()
                .Property(e => e.ExchangeRate)
                .HasPrecision(18, 4);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Reports)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
