using System.Web.Optimization;

namespace EstReport.App_Start
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/lib/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/lib/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/lib/jquery.unobtrusive*",
                        "~/Scripts/lib/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
                        "~/Scripts/lib/knockout-{version}.js",
                        "~/Scripts/lib/knockout-{version}.debug.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Scripts/lib/bootstrap.js",
                        "~/Scripts/lib/bootstrap.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/model").Include(
                        "~/Scripts/core/AppModel.js",
                        "~/Scripts/core/BuildModel.js",
                        "~/Scripts/core/ManageAppModel.js"));

            bundles.Add(new ScriptBundle("~/bundles/moment").Include(
                        "~/Scripts/lib/moment.js",
                        "~/Scripts/lib/moment.min.js",
                        "~/Scripts/lib/moment-with-locales.js",
                        "~/Scripts/lib/moment-with-locales.min.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/lib/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                        "~/Content/site.css",
                        "~/Content/main.css"));

            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
                        "~/Content/bootstrap-theme.css",
                        "~/Content/bootstrap-theme.min.css",
                        "~/Content/bootstrap.css",
                        "~/Content/bootstrap.min.css"));

            BundleTable.EnableOptimizations = true;
        }
    }
}