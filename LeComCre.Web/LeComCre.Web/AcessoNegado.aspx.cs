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
            String pag = Request.QueryString["Pagina"];
            pagina.Text = pag;
            
        }
    }
}
