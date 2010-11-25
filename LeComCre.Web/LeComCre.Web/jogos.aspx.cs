using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;
using System.Data;

namespace LeComCre.Web
{
    public partial class jogos : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ( ( MasterJogos )this.Master ).setUsuario = getNomeUsuarioLogado;

                if ( !IsPostBack )
                {
                    RepeaterMenuJogos.DataBind();

                    string op = Request.QueryString[ "p" ] == null ? "" : Request.QueryString[ "p" ];
                    if ( !string.IsNullOrEmpty( op ) )
                    {
                        HabilitarGame( op );
                    } else
                    {
                        Random rd = new Random();
                        int idx = rd.Next( RepeaterMenuJogos.Items.Count ) + 1;
                        DataRow dr = new Aplicativos().getJogosById( idx ).Tables[ 0 ].Rows[ 0 ];
                        string parm = string.Format( "{0}|{1}", dr[ "Url" ], dr[ "Nome" ] );
                        HabilitarGame( parm );
                    }
                }
            } catch ( Exception ex )
            {
                LogarErro( "(jogos) Page_Load " + ex.Message, ex );
                Alert( ex.Message );
            }
        }

        protected void RepeaterMenuJogos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                string parm = e.CommandArgument.ToString();
                if ( e.CommandName == "Play" )
                {
                    HabilitarGame( parm );
                }
            } catch ( Exception ex ) {
                LogarErro( "(jogos) RepeaterMenuJogos_ItemCommand " + ex.Message, ex );
                Alert( ex.Message );
            }

        }

        private void HabilitarGame(string parm)
        {
            lblTitle.Text = parm.Split( '|' )[ 1 ].ToString();
            FlashControl1.MovieUrl = "~/conteudo/Jogos/" + parm.Split( '|' )[ 0 ].ToString();
            FlashControl1.Visible = true;
            FlashControl1.Play = true;
        }
    }
}
