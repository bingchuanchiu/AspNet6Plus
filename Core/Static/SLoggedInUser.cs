using System.Collections.Generic;

namespace Core.Static
{
    public static class SLoggedInUser
    {
        public static int userID { get; set; }
        public static string userName { get; set; }
        public static List<string> permissions { get; set; }
        public static string userAgent { get; set; }
        public static string curURL { get; set; }
        public static string refURL { get; set; }

        public static string clientIP { get; set; }

        public static string ASPNETCORE_ENVIRONMENT { get; set; }

        public static bool GetAuthorization(string controller, string action)
        {
            bool temp = false;

            var tempStr = string.Join(" ", permissions);

            temp = tempStr.IndexOf(controller + "s" + action) > -1 ? true : false;

            temp = tempStr.IndexOf("SuperUser") > -1 ? true : false;

            return temp;
        }
    }
}
