using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;

namespace LeComCre.Web
{
    public partial class Cadastrar : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ( ( MasterCadastro )this.Master ).setUsuario = getNomeUsuarioLogado;
        }

        protected void rdCrianca_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/CadUsuario.aspx?op=2", true);
        }

        protected void rdAdulto_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/CadUsuario.aspx?op=3", true);
        }

        protected void rdProfissional_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/CadUsuario.aspx?op=4", true);
        }
    }
}
