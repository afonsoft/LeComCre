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
                RepeaterAssunto.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
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
            }
        }
    }
}
