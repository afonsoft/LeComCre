using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;

namespace LeComCre.Web
{
    public partial class Buscar : pageBase
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            ( ( MasterBuscar )this.Master ).setUsuario = getNomeUsuarioLogado;

            if ( !IsPostBack )
            {
                string op = Request.QueryString[ "b" ] == null ? "" : Request.QueryString[ "b" ];
                if ( !string.IsNullOrEmpty( op ) )
                {
                    txtBuscar.Text = op;
                    RepeaterJogos.DataBind();
                    RepeaterColorir.DataBind();
                    RepeaterAssunto.DataBind();
                }
            }
        }

        protected void btnBuscar_Click( object sender, EventArgs e )
        {
            RepeaterJogos.DataBind();
            RepeaterColorir.DataBind();
            RepeaterAssunto.DataBind();
        }
    }
}
