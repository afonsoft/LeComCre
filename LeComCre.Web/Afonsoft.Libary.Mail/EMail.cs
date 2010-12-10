using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using Afonsoft.Libary;
using System.Net.Mime;

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
        string _Port = "25";
        bool _EnableSsl = false;
        List<string> LstFile = new List<string>();
        NetworkCredential _Credential = null;

        #region Construdor
        public EMail()
        { }
        public EMail(string server, int port, bool enableSsl, NetworkCredential credential)
        {
            Config( server, port, null, null, enableSsl, true, credential );
        }
        public EMail( string server, int port, string user, string pass )
        {
            Config( server, port, user, pass, false, true, new NetworkCredential() );
        }
        public EMail(string server, int port, string user, string pass, bool enableSsl, bool userCredetial, NetworkCredential credential)
        {
            Config( server, port, user, pass, enableSsl, userCredetial, credential );
        }
        public EMail( string server, string user, string pass, bool userCredetial, NetworkCredential credential )
        {
            Config( server, 25, user, pass, false, userCredetial, credential );
        }
        private void Config( string server, int port, string user, string pass, bool enableSsl, bool userCredetial, NetworkCredential credential )
        {
            SmtpServer = server; Port = port.ToString(); User = user; Password = pass; EnableSsl = enableSsl; UseCredentials = userCredetial; Credential = credential;
        }
        #endregion
        
        #region Get and Set

        public NetworkCredential Credential
        {
            get
            {
                if ( _Credential == null )
                    _Credential = new NetworkCredential( User, Password );
                return _Credential;
            }
            set { _Credential = value; }
        }

        public string Port
        {
            get { return _Port; }
            set { _Port = value; }
        }

        public bool EnableSsl
        {
            get { return _EnableSsl; }
            set { _EnableSsl = value; }
        }

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
        public Boolean UseCredentials
        {
            get { return _UseDefaultCredentials; }
            set { _UseDefaultCredentials = value; }
        }
        #endregion

        public void AddFile( string path )
        {
            if ( !LstFile.Contains( path ) )
                LstFile.Add( path );
        }

        public int CountFile()
        {
            return LstFile.Count;
        }
        
        public void EnviarEmail()
        {
            
            MailMessage mail = new MailMessage();
            SmtpClient smtp = null;

            try
            {

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
                }
                else if ( To.IndexOf( "," ) >= 0 )
                {
                    string[] para = To.Split( ',' );
                    for ( int i = 0; i < para.Length; i++ )
                    {
                        if ( !string.IsNullOrEmpty( para[ i ].Trim() ) )
                            mail.To.Add( para[ i ].Trim().ToLower() );
                    }
                }
                else
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
                    }
                    else if ( CC.IndexOf( "," ) >= 0 )
                    {
                        string[] cc = CC.Split( ',' );
                        for ( int i = 0; i < cc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( cc[ i ].Trim() ) )
                                mail.CC.Add( cc[ i ].Trim().ToLower() );
                        }
                    }
                    else
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
                    }
                    else if ( CCo.IndexOf( "," ) >= 0 )
                    {
                        string[] Bcc = CCo.Split( ',' );
                        for ( int i = 0; i < Bcc.Length; i++ )
                        {
                            if ( !string.IsNullOrEmpty( Bcc[ i ].Trim() ) )
                                mail.Bcc.Add( Bcc[ i ].Trim().ToLower() );
                        }
                    }
                    else
                    {
                        mail.Bcc.Add( CCo.Trim().ToLower() );
                    }
                }
                #endregion

                mail.From = from;
                mail.Subject = Subject;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.Normal;
                mail.ReplyTo = from;
                mail.Body = Body;
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString( Body, Encoding.UTF8, "text/html" );
                mail.AlternateViews.Add( htmlView );

                foreach ( string file in LstFile )
                {
                    if ( !string.IsNullOrEmpty( file ) )
                        mail.Attachments.Add( new Attachment( file, MediaTypeNames.Application.Octet ) );
                }

                smtp = new SmtpClient( SmtpServer, int.Parse( Port ) );
                smtp.Timeout = 1800000; // 30 Minutos
                smtp.UseDefaultCredentials = false;
                if ( UseCredentials ) smtp.Credentials = Credential; 
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = EnableSsl;
                smtp.Send( mail );
            }
            catch ( Exception e )
            {
                throw new Exception( "Metodo: EnviarEmail - (EMail.cs): " + e.Message, e );
            }
            finally
            {
                mail = null;
                smtp = null;
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
