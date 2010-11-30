using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web
{
    public partial class TemaAsp : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ( ( MasterTemas )this.Master ).setUsuario = getNomeUsuarioLogado;
                if ( !IsPostBack )
                {
                    RepeaterTema.DataBind();
                    Random rd = new Random();
                    int idx = rd.Next( RepeaterTema.Items.Count ) + 1;
                    if ( !PopularTela( idx ) )
                    {
                        PopularTela( 1 );
                    }
                }

            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Temas.aspx) - Page_Load", ex);
            }
        }

        protected void RepeaterTema_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int idTema = int.Parse(e.CommandArgument.ToString());
            
            lblTitle.Text = string.Empty;
            desc.InnerHtml = string.Empty;

            if (e.CommandName == "View")
            {
                PopularTela( idTema );
            }
        }

        private bool PopularTela( int idTema )
        {
            try
            {
                tema t = new Temas().getTemaById( idTema );

                lblTitle.Text = t.Tema;
                desc.InnerHtml = t.Texto;
                lblData.Text = Utils.FormatDate( t.DtEvento.ToString(), Utils.TipoData.Barra );
                return true;
            } catch ( Exception ex ) 
            {
                LogarErro( "(TemaAsp) PopularTela - idTema: " + idTema + " Erro: " + ex.Message, ex );
                return false;
            }
        }
    }
}
