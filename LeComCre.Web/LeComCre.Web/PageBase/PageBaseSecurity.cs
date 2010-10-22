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
    public class pageBaseSecurity : pageBase
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (isLogado)
                CheckSession();
            else
                Response.Redirect("~/Login.aspx?p=" + Request.FilePath, true);
        }

        private void CheckSession()
        {
            Usuario user = UsuarioLogado;
            int tipo;
            if (user != null)
            {
                tipo = user.Tipo_Usuario.Tipo_Usuario_id;
                if (!CheckPage(Request.Path.Replace("/",""), tipo))
                    Response.Redirect("~/AcessoNegado.aspx", true);
            }
            else
                Response.Redirect("~/Login.aspx", true);

        }

        private bool CheckPage(string page, int tipoUser)
        {
            return true;
        }
    }
}
