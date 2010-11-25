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

        protected void RepeaterColorir_ItemCommand( object source, RepeaterCommandEventArgs e )
        {
            int idColorir = int.Parse( e.CommandArgument.ToString() );

            if ( e.CommandName == "View" )
            {
                Response.Redirect( "~/Colorir.aspx?p=" + idColorir );
            }
        }
        protected void RepeaterJogos_ItemCommand( object source, RepeaterCommandEventArgs e )
        {
            string parm = e.CommandArgument.ToString();
            if ( e.CommandName == "Play" )
            {
                Response.Redirect( "~/jogos.aspx?p=" + parm );
            }
        }
    }
}
