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
    public partial class jogos : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RepeaterMenuJogos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                string parm = e.CommandArgument.ToString();
                if ( e.CommandName == "Play" )
                {
                    lblTitle.Text = parm.Split( '|' )[ 1 ].ToString();
                    FlashControl1.MovieUrl = "~/conteudo/Jogos/" + parm.Split( '|' )[ 0 ].ToString(); 
                    FlashControl1.Visible = true;
                    FlashControl1.Play = true;
                }
            } catch ( Exception ex ) {
                LogarErro( "(jogos) RepeaterMenuJogos_ItemCommand " + ex.Message, ex );
                Alert( ex.Message );
            }

        }
    }
}
