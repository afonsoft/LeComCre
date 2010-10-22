using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using Afonsoft.Libary.Mail;
using System.Configuration;
using System.Text;

namespace LeComCre.Web
{
    public partial class RecuperarSenha : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                using (EMail m = new EMail())
                {
                    m.From = "lecomcre@afonsoft.com";
                    m.CCo = "lecomcre@afonsoft.com;afonsoft@hotmail.com";
                    m.To = txtMail.Text;
                    m.Body = pegarCorpoMail(txtCPF.Text);
                    m.Subject = "Lé Com Cré - Lembrete de senha";
                    m.UseDefaultCredentials = true;
                    m.User = ConfigurationSettings.AppSettings["smtpUser"];
                    m.Password = ConfigurationSettings.AppSettings["smtpPass"];
                    m.SmtpServer = ConfigurationSettings.AppSettings["smtpServer"];
                    m.DisplayName = ConfigurationSettings.AppSettings["DisplayName"];
                    m.EnviarEmail();
                    Alert("E-Mail com a senha enviado com sucesso!");
                    JavaScript("window.location.href='index.htm'");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
            }
        }

        private string pegarCorpoMail(string p)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("");

            return sb.ToString();
        }
    }
}
