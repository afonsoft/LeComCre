using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;

namespace LeComCre.Web
{
    public partial class Login : pageBase
    {
        string p = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (isLogado)
                Response.Redirect("~/Default.aspx", true);
            p = (Request.QueryString["p"] != null ? Request.QueryString["p"] : "");
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Security().Login(txtUsuario.Text, txtSenha.Text);
                Session["UsuarioLogado"] = user;
                if(!String.IsNullOrEmpty(p))
                    Response.Redirect(p , true);
                else
                    Response.Redirect("~/Default.aspx", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Aviso", "alert('" + ex.Message.Replace("'","`") + "')", true);
            }
        }

        protected void btnReenviarSenha_Click(object sender, EventArgs e)
        {

        }
    }
}
