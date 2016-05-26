using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EstReport.Models.Managers
{
    public class ReportManager
    {
        public static List<Report> GetReportsByUserId(Guid userId)
        {
            var context = new EstateDbContext();
            var reportList = context.Reports.Where(rep => rep.UserId == userId).ToList();

            return reportList;
        }

        public static void AddReport(Report newReport)
        {
            var context = new EstateDbContext();
            context.Reports.Add(newReport);

            context.SaveChanges();
        }


    }
}