using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using Afonsoft.Libary.Mail;
using System.Configuration;
using LeComCre.Web.Negocios;

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
                Mail.SendMail("lecomcre@afonsoft.com", 
                                txtMail.Text, 
                                "Lé Com Cré - Nome: " + txtNome.Text + " - Assunto: " + ddlAssunto.Text + " " + txtOutros.Text + " - CPF: " + txtCPF.Text, 
                                txtDesc.Text); 
                
                Alert("E-Mail enviado com sucesso.", "index.html");
                
            }
            catch (Exception ex) 
            {
                Alert(ex.Message);
                LogarErro("(email.aspx) - btnEnviar_Click", ex);
            }
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
