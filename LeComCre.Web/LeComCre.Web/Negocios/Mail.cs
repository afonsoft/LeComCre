using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Mail;
using System.Configuration;

namespace LeComCre.Web.Negocios
{
    public static class Mail
    {
        public static void SendMail( string to, string subject, string Body )
        {
            SendMail( to, "", subject, Body );
        }
        public static void SendMail( string to, string Body )
        {
            SendMail( to, "", "Lé Com Cré", Body );
        }
        public static void SendMail( string to, string cc, string subject, string Body )
        {
            using ( EMail m = new EMail() )
            {
                m.From = "lecomcre@afonsoft.com";
                m.To = to;
                m.CC = cc;
                m.Body = Body;
                m.Subject = subject;
                m.UseDefaultCredentials = true;
                m.User = ConfigurationSettings.AppSettings[ "smtpUser" ];
                m.Password = ConfigurationSettings.AppSettings[ "smtpPass" ];
                m.SmtpServer = ConfigurationSettings.AppSettings[ "smtpServer" ];
                m.DisplayName = ConfigurationSettings.AppSettings[ "DisplayName" ];
                m.EnviarEmail();
            }
        }
    }
}
