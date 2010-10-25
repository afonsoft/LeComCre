using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;
using AjaxControlToolkit;

namespace LeComCre.Web
{
    public partial class Admin : pageBaseSecurity
    {

        public bool popupInfoUser
        {
            get { return (ViewState["popupInfoUser"] != null ? (bool)ViewState["popupInfoUser"] : false ); }
            set { ViewState["popupInfoUser"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Verificar se é um Adiministrador
                if (isLogado & UsuarioLogado.Usuario_id == 1)
                {

                }
                else
                {
                    Alert("Usuario não é o administrador para acessar essa pagina.", "Default.aspx");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message, "Default.aspx");
                LogarErro("(Admin.aspx)", ex);
            }
        }

        protected void GridViewTemas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idTema = int.Parse(e.CommandArgument.ToString());
            string pag = "~/Tema.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(idTema + "|1")+ "&rtl=adimin.aspx";
            Response.Redirect(pag, true);
        }

        protected void GridViewUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idUsuario = int.Parse(e.CommandArgument.ToString());
            popupInfoUser = false;
            if (e.CommandName == "Select")
            {
                DetailsViewInfoUsuario.DataBind();
            }
            if (e.CommandName == "Aprov")
            {

            }
        }

        protected void UpdatePanelUsuarios_PreRender(object sender, EventArgs e)
        {
            if (popupInfoUser)
            {
                ScriptManager.RegisterStartupScript(UpdatePanelUsuarios, UpdatePanelUsuarios.GetType(), "InfoUsuario", "OpenInfoUser();", true);
                popupInfoUser = false;
            }
        }

        protected void DetailsViewInfoUsuario_DataBound(object sender, EventArgs e)
        {
            popupInfoUser = true;
        }

                
    }
}
