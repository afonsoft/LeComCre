using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using Afonsoft.Libary;

namespace Afonsoft.Libary.Mail
{
    public class EMail : IDisposable
    {

        String _From = "xxx@xxx.com";
        String _To = "xxx@xxx.com";
        String _Subject = "Subject";
        String _Body = "Body";
        String _Smtp = "Smtp";
        Boolean _UseDefaultCredentials = false;
        String _User = "User";
        String _Pass = "Pass";

        #region Get and Set
        public String Password
        {
            get { return _Pass; }
            set { _Pass = value; }
        }
        public String User
        {
            get { return _User; }
            set { _User = value; }
        }
        public String To
        {
            get { return _To; }
            set { _To = value; }
        }
        public String From
        {
            get { return _From; }
            set { _From = value; }
        }
        public String Subject
        {
            get { return _Subject; }
            set { _Subject = value; }
        }
        public String Body
        {
            get { return _Body; }
            set { _Body = value; }
        }
        public String SmtpServer
        {
            get { return _Smtp; }
            set { _Smtp = value; }
        }
        public Boolean UseDefaultCredentials
        {
            get { return _UseDefaultCredentials; }
            set { _UseDefaultCredentials = value; }
        }
        #endregion

        public void EnviarEmail()
        {
            try
            {
                MailAddress SendFrom = new MailAddress(From);
                MailAddress SendTo = new MailAddress(To);

                MailMessage mail = new MailMessage(SendFrom, SendTo);
                mail.Subject = Subject;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.Low;
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(Body, Encoding.UTF8, "text/html");
                mail.AlternateViews.Add(htmlView);
                SmtpClient smtp = new SmtpClient(SmtpServer);
                smtp.Timeout = 30000;
                smtp.UseDefaultCredentials = UseDefaultCredentials;
                if (UseDefaultCredentials)
                {
                    smtp.Credentials = new System.Net.NetworkCredential(User, Password);
                }
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                smtp.Send(mail);
            }
            catch (Exception e)
            {
                throw new Exception("Metodo: EnviarEmail - (EMail.cs)", e);
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            _From = String.Empty;
            _To = String.Empty;
            _Subject = String.Empty;
            _Body = String.Empty;
            _Smtp = String.Empty;
            _UseDefaultCredentials = false;
            _User = String.Empty;
            _Pass = String.Empty;
            GC.SuppressFinalize(this);
        }

        #endregion

        #region IDisposable Members

        void IDisposable.Dispose()
        {
            _From = String.Empty;
            _To = String.Empty;
            _Subject = String.Empty;
            _Body = String.Empty;
            _Smtp = String.Empty;
            _UseDefaultCredentials = false;
            _User = String.Empty;
            _Pass = String.Empty;
            GC.SuppressFinalize(this);
        }

        #endregion
    }
}
