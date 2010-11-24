using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Utilities;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;

namespace LeComCre.Web
{
    public partial class Anuncie : pageBase
    {
        protected void Page_Load( object sender, EventArgs e )
        {

        }

        protected void btnEnviar_Click( object sender, EventArgs e )
        {
            try
            {
                Mail.SendMail( "lecomcre@afonsoft.com",
                                txtMail.Text,
                                "Contato Empresa - " + txtNome.Text + " : " + txtTelefone.Text,
                                txtDesc.Text );

                Alert( "E-Mail enviado com sucesso.", "index.html" );

            } catch ( Exception ex )
            {
                Alert( ex.Message );
                LogarErro( "(email.aspx) - btnEnviar_Click", ex );
            }
        }
    }
}
