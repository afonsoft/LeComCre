using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;

namespace LeComCre.Web
{
    public partial class AcessoNegado : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ( ( MasterNegado )this.Master ).setUsuario = getNomeUsuarioLogado;

            String pag = Request.QueryString["Pagina"];
            pagina.Text = pag;
            LogarErro( "Usuario:"+ getNomeUsuarioLogado +", sem acesso a pagina: " + pag );

        }
    }
}
