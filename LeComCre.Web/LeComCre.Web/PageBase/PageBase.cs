using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using Afonsoft.Libary.Data;
using LeComCre.Web.Negocios;

namespace LeComCre.Web.PageBase
{
    public class pageBase : System.Web.UI.Page
    {
        #region Security
        Security security = null;
        public pageBase()
        {
            security = new Security();
        }
        #endregion

        #region Recuperar o nome para exibição (getNomeUsuarioLogado)
        public string getNomeUsuarioLogado
        {
            get
            {
                string info = string.Empty;
                if ( isLogado )
                {
                    info = string.Format( "<span class='td_dados'>Olá {0}!<br />(Não é você, <a href='Login.aspx?op=Sair' class='td_dados'>clique aqui</a> para sair)</span>", UsuarioLogado.Nome );
                } else
                {
                    info = "<span class='td_dados'>Olá Visitante!<br />(Não é você, <a href='Login.aspx' class='td_dados'>clique aqui</a> para se logar)</span>";
                }
                return info;
            }
        }
        #endregion

        #region UsuarioLogado
        public Usuario UsuarioLogado
        {
            get
            {
                return ( Session[ "UsuarioLogado" ] != null ? ( Usuario )Session[ "UsuarioLogado" ] : null );
            }
        }

        public bool isLogado
        {
            get
            {
                return ( Session[ "UsuarioLogado" ] != null ? true : false );
            }
        }
        #endregion

        #region OnInit

        protected override void OnInit( EventArgs e )
        {
            base.OnInit( e );
            if ( !IsPostBack )
                LogarAcesso();
        }
        #endregion

        #region Logar Registro de Acesso

        public void LogarAcesso()
        {
            try
            {
                string pagina = ( String.IsNullOrEmpty( Request.RawUrl ) ? Request.Path : Request.RawUrl );
                Usuario user = this.UsuarioLogado;
                if ( isLogado )
                    security.LogarAcesso( pagina, user );
            } catch ( Exception ) { }
        }

        #endregion

        #region LogarErro
        public void LogarErro( string msg, Exception ex )
        {
            security.RegistrarErro( msg, ex );
        }
        public void LogarErro( string msg )
        {
            security.RegistrarErro( msg, null );
        }
        #endregion

        #region JavaScript
        public void JavaScript( string jsString )
        {
            //Localizar a pagina atual
            Page p = ( this.Master != null ? this.Master.Page : this.Page );
            jsString = ( jsString.LastIndexOf( ';' ) == jsString.Length ? jsString : ( jsString.LastIndexOf( ';' ) == jsString.Length - 1 ? jsString : jsString + ";" ) );
            string rtv = "try { " + jsString + " } catch (e) { alert(e); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript( p, p.GetType(), "jsString", rtv, true );
        }
        #endregion

        #region alert
        public void Alert( string msg )
        {
            //Localizar a pagina atual
            Page p = ( this.Master != null ? this.Master.Page : this.Page );
            // Tratar a String
            string vl = msg.Replace( "'", "`" ).Replace( "\"", "`" ).Replace( "\r\n", "" ).Replace( "\n", "\\n" ).Replace( "\r", "" );
            string rtv = "try { Aviso('" + vl + "'); } catch (e) { alert('" + vl + "'); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript( p, p.GetType(), "Aviso", rtv, true );
        }

        public void Alert( string msg, string Redirect )
        {
            //Localizar a pagina atual
            Page p = ( this.Master != null ? this.Master.Page : this.Page );
            // Tratar a String
            string vl = msg.Replace( "'", "`" ).Replace( "\"", "`" ).Replace( "\r\n", "" ).Replace( "\n", "\\n" ).Replace( "\r", "" );
            string rtv = "try { AvisoRedirect('" + vl + "','" + Redirect + "'); } catch (e) { alert('" + vl + "'); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript( p, p.GetType(), "AvisoRedirect", rtv, true );
        }
        #endregion

        #region Confirm
        public void ConfirmAviso( string msg, string EventoClick )
        {
            //Localizar a pagina atual
            Page p = ( this.Master != null ? this.Master.Page : this.Page );
            // Tratar a String
            string vl = msg.Replace( "'", "`" ).Replace( "\"", "`" ).Replace( "\r\n", "" ).Replace( "\n", "\\n" ).Replace( "\r", "" );
            string rtv = "try { ConfirmAviso('" + vl + "','" + EventoClick + "'); } catch (e) { alert('" + vl + "'); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript( p, p.GetType(), "ConfirmAviso", rtv, true );
        }
        #endregion

    }
}
