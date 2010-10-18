using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using Afonsoft.Libary.Mail;

namespace LeComCre.Web
{
    public partial class email : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                using (EMail mail = new EMail())
                {
                    
                }
            }
            catch (Exception ex) { }
        }

        protected void ddlAssunto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((DropDownList)sender).SelectedItem.Value.Equals("Outros"))
            {
                txtOutros.Text = "";
                txtOutros.Style["display"] = "block";
            }
            else
            {
                txtOutros.Style["display"] = "none";
                txtOutros.Text = "";
            }
        }
    }
}
