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



        #region alert
        public void Alert(string msg)
        {
            Page p = (this.Master != null ? this.Master.Page : this.Page);

            string m = msg.Replace("'", "`");
            ScriptManager.RegisterClientScriptBlock(this ,this.GetType(), "Aviso", "try { Aviso('" + m + "'); } catch (e) { alert('" + m + "'); }; return true;", true);
        }
        #endregion
    }
}
