namespace EstReport.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Report
    {
        public Guid Id { get; set; }

        [StringLength(256)]
        public string Customer { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfEvaluation { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfReportFinish { get; set; }

        public decimal? ExchangeRate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ExpirationDate { get; set; }

        public string EvaluationGoal { get; set; }

        [StringLength(256)]
        public string Evaluator { get; set; }

        public Guid EstateId { get; set; }

        public Guid EvaluationTypeId { get; set; }

        public Guid UserId { get; set; }

        public virtual Estate Estate { get; set; }

        public virtual EvaluationType EvaluationType { get; set; }

        public virtual User User { get; set; }
    }
}
