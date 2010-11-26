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
    public partial class Default : pageBase
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            lblUsuarioLogado.Text = getNomeUsuarioLogado;
        }

        protected void btnBuscar_Click( object sender, EventArgs e )
        {
            if ( string.IsNullOrEmpty( txtBuscar.Text ) )
                Alert( "Favor digitar alguma coisa para buscar." );
            else if ( txtBuscar.Text.Length <= 3 )
                Alert( "Favor digitar mais de 3 caracteres." );
            else
                Response.Redirect( "Buscar.aspx?b=" + txtBuscar.Text.Trim() );
        }
    }
}
