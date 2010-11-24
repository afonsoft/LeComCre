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

            ( ( MasterLogin )this.Master ).setUsuario = getNomeUsuarioLogado;
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            bool ok = false;
            try
            {
                Usuario user = new Security().Login(txtUsuario.Text, txtSenha.Text);
                user.Host = Request.UserHostAddress;
                Session["UsuarioLogado"] = user;
                ok = true;
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Login.aspx) - btnLogar_Click (U: " + txtUsuario.Text + " | S: " + txtSenha.Text + ")", ex);
            }
            if (ok)
            {
                if (!String.IsNullOrEmpty(p))
                    Response.Redirect(p, true);
                else
                    Response.Redirect("~/Default.aspx", true);
            }
        }
    }
}
