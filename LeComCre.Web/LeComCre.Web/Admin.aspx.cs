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
                    Alert("Usuario não é o administrador para acessar essa pagina.");
                    JavaScript("window.location.href='AcessoNegado.aspx?Pagina=Admin.aspx'");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                JavaScript("window.location.href='AcessoNegado.aspx?Pagina=Admin.aspx'");
            }
        }
    }
}
