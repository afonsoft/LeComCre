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

        #region UsuarioLogado
        public Usuario UsuarioLogado
        {
            get 
            {
                return (Session["UsuarioLogado"] != null ? (Usuario)Session["UsuarioLogado"] : null);
            }
        }

        public bool isLogado
        {
            get
            {
                return (Session["UsuarioLogado"] != null ? true : false);
            }
        }
        #endregion

        #region OnInit

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if(!IsPostBack)
                LogarAcesso();
        }
        #endregion

        #region Logar Registro de Acesso

        public void LogarAcesso()
        {
            string pagina = (String.IsNullOrEmpty(Request.RawUrl) ? Request.Path : Request.RawUrl);
            Usuario user = this.UsuarioLogado;
            if (isLogado)
                security.LogarAcesso(pagina, user);
        }

        #endregion

        #region LogarErro
        public void LogarErro(string msg, Exception ex)
        {
            security.RegistrarErro(msg, ex);
        }
        public void LogarErro(string msg)
        {
            security.RegistrarErro(msg, null);
        }
        #endregion

        #region JavaScript
        public void JavaScript(string jsString)
        {
            //Localizar a pagina atual
            Page p = (this.Master != null ? this.Master.Page : this.Page);
            string rtv = "try { " + jsString + " ); } catch (e) { alert(e); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript(p, p.GetType(), "jsString", rtv, true);
        }
        #endregion

        #region alert
        public void Alert(string msg)
        {
            //Localizar a pagina atual
            Page p = (this.Master != null ? this.Master.Page : this.Page);
            // Tratar a String
            string vl = msg.Replace("'", "`").Replace("\"", "`").Replace("\r\n", "").Replace("\n", "\\n").Replace("\r", "");
            string rtv = "try { Aviso('" + vl + "'); } catch (e) { alert('" + vl + "'); };";
            //Registrar o script na pagina correta.
            ScriptManager.RegisterStartupScript(p ,p.GetType(), "Aviso", rtv, true);
        }
        #endregion
    }
}
