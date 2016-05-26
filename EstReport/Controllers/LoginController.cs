using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace EstReport.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Login(String username, String password)
        {
           /* try
            {
                bool isLoginValid = Service.ValidLogin(username, password);
                if (isLoginValid)
                {
                    FormsAuthentication.SetAuthCookie(username, false);
                    System.Web.HttpContext.Current.Session["UserName"] = username;
                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception e)
            {

            }
            ViewBag.loginFailed = "The User Name or Password you have typed is incorrect. Please retype again.";*/
            //ModelState.AddModelError("", "The User Name or Password you have typed is incorrect. Please retype again.");
            return View();
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Login");
        }
    }
}