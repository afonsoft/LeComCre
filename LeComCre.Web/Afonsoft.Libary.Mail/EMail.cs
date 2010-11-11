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

        string _From = string.Empty;
        string _To = string.Empty;
        string _CC = string.Empty;
        string _CCo = string.Empty;
        string _Subject = string.Empty;
        string _Body = string.Empty;
        string _Smtp = string.Empty;
        bool _UseDefaultCredentials = false;
        string _User = string.Empty;
        string _Pass = string.Empty;
        string _DisplayName = string.Empty;

        #region Get and Set

        public string DisplayName
        {
            get { return ( string.IsNullOrEmpty( _DisplayName ) ? From : _DisplayName ); }
            set { _DisplayName = value; }
        }

        public string CCo
        {
            get { return _CCo; }
            set { _CCo = value; }
        }

        public string CC
        {
            get { return _CC; }
            set { _CC = value; }
        }
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

                MailMessage mail = new MailMessage();

                MailAddress from = new MailAddress( From.Trim().ToLower(), DisplayName );

                #region Tratar To CC CCo

                if ( To.IndexOf( ";" ) >= 0 )
                {
                    string[] para = To.Split( ';' );
                    for ( int i = 0; i < para.Length; i++ )
                    {
                        if ( !string.IsNullOrEmpty( para[ i ].Trim() ) )
                            mail.To.Add( para[ i ].Trim().ToLower() );
                    }
                } else if ( To.IndexOf( "," ) >= 0 )
                {
                    string[] para = To.Split( ',' );
                    for ( int i = 0; i < para.Length; i++ )
                    {
                        if ( !string.IsNullOrEmpty( para[ i ].Trim() ) )
                            mail.To.Add( para[ i ].Trim().ToLower() );
                    }
                } else
                {
                    mail.To.Add( To.Trim().ToLower() );
                }
                if ( !( CC.Equals( "" ) ) )
                {
                    if ( CC.IndexOf( ";" ) >= 0 )
                    {
                        string[] cc = CC.Split( ';' );
                        for ( int i = 0; i < cc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( cc[ i ].Trim() ) )
                                mail.CC.Add( cc[ i ].Trim().ToLower() );
                        }
                    } else if ( CC.IndexOf( "," ) >= 0 )
                    {
                        string[] cc = CC.Split( ',' );
                        for ( int i = 0; i < cc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( cc[ i ].Trim() ) )
                                mail.CC.Add( cc[ i ].Trim().ToLower() );
                        }
                    } else
                    {
                        mail.CC.Add( CC.Trim().ToLower() );
                    }
                }
                if ( !( CCo.Equals( "" ) ) )
                {
                    if ( CCo.IndexOf( ";" ) >= 0 )
                    {
                        string[] Bcc = CCo.Split( ';' );
                        for ( int i = 0; i < Bcc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( Bcc[ i ].Trim() ) )
                                mail.Bcc.Add( Bcc[ i ].Trim().ToLower() );
                        }
                    } else if ( CCo.IndexOf( "," ) >= 0 )
                    {
                        string[] Bcc = CCo.Split( ',' );
                        for ( int i = 0; i < Bcc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( Bcc[ i ].Trim() ) )
                                mail.Bcc.Add( Bcc[ i ].Trim().ToLower() );
                        }
                    } else
                    {
                        mail.Bcc.Add( CCo.Trim().ToLower() );
                    }
                }
                #endregion

                mail.From = from;
                mail.Subject = Subject;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.Low;
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString( Body, Encoding.UTF8, "text/html" );
                mail.AlternateViews.Add( htmlView );
                SmtpClient smtp = new SmtpClient( SmtpServer );
                smtp.Timeout = 30000;
                smtp.UseDefaultCredentials = UseDefaultCredentials;
                if ( UseDefaultCredentials )
                {
                    smtp.Credentials = new System.Net.NetworkCredential( User, Password );
                }
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                smtp.Send( mail );
            } catch ( Exception e )
            {
                throw new Exception( "Metodo: EnviarEmail - (EMail.cs)", e );
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
            GC.SuppressFinalize( this );
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
            GC.SuppressFinalize( this );
        }

        #endregion
    }
}
