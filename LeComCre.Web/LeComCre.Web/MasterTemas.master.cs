using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeComCre.Web
{
    public partial class MasterTemas : System.Web.UI.MasterPage
    {
        public string setUsuario
        {
            set
            {
                lblUsuarioLogado.Text = value;
            }
        }

        protected void Page_Load( object sender, EventArgs e )
        {

        }
    }
}
