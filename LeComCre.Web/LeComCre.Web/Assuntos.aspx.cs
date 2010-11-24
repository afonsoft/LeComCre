using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;
using AjaxControlToolkit;

namespace LeComCre.Web
{
    public partial class Assuntos : pageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ( ( MasterForum )this.Master ).setUsuario = getNomeUsuarioLogado;

                string op = Request.QueryString[ "b" ] == null ? "" : Request.QueryString[ "b" ];

                if ( !IsPostBack )
                {
                    if(!string.IsNullOrEmpty(op))
                    {
                        txtAssunto.Text = op.Trim();
                        btnBuscarAssunto_Click( sender, e );
                    }       
                }

            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Assuntos.aspx) - Page_Load", ex);
            }
        }

        protected void btnBuscarAssunto_Click(object sender, EventArgs e)
        {
            try
            {
                RepeaterAssunto.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Assuntos.aspx) - btnBuscarAssunto_Click", ex);
            }
        }
    }
}
