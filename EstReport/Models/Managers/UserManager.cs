using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EstReport.Models.Managers
{
    public class UserManager
    {
        public static List<User> GetUsers()
        {
            var context = new EstateDbContext();
            var userList = context.Users.ToList();

            return userList;
        }

        public static bool ValidLogin(string username, string password)
        {
            var db = new EstateDbContext();
            bool isLoginValid = db.Users.Any(p => p.Name == username && p.Password == password);
            if (isLoginValid)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}