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
    public partial class TemaAsp : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                    RepeaterTema.DataBind();
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
                tema t = new Temas().getTemaById(idTema);

                lblTitle.Text = t.Tema;
                desc.InnerHtml = t.Texto;

            }
        }
    }
}
