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
    public partial class acessibilidade : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ( ( Masteracessibilidade )this.Master ).setUsuario = getNomeUsuarioLogado;
        }
    }
}
