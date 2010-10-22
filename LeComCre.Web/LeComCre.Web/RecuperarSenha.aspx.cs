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
using LeComCre.Web.Negocios;

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

            LeComCre.Web.Negocios.Usuario user = new LeComCre.Web.Negocios.NegUsuario().getUsuarioByEmail(p);

            sb.Append("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>");
            sb.Append("<html xmlns='http://www.w3.org/1999/xhtml' >");
            sb.Append("<head></head>");
            sb.Append("<body>");
            sb.Append("<table width='60%' border='0' cellpadding='3' cellspacing='3'>");
            sb.Append("        <tr>");
            sb.Append("            <td colspan='2' align='center' style='font-size: 12px; font-family: Verdana, Tahoma;'>");
            sb.Append("                <span>Lé Com Cré - Solicitação de envio de senha</span>");
            sb.Append("            </td>");
            sb.Append("        </tr>");
            sb.Append("        <tr>");
            sb.Append("            <td style='background-color: #CfCfCf; width: 10%; font-size: 11px; font-family: Verdana, Tahoma;'>");
            sb.Append("                <b>Login:</b>");
            sb.Append("            </td>");
            sb.Append("            <td style='background-color: #FFFFFC; width: 90%; font-size: 11px; font-family: Verdana, Tahoma;'>");
            sb.Append("            " + user.EMail);
            sb.Append("            </td>");
            sb.Append("        </tr>");
            sb.Append("        <tr>");
            sb.Append("            <td style='background-color: #CfCfCf; width: 10%; font-size: 11px; font-family: Verdana, Tahoma;'>");
            sb.Append("                <b>Senha:</b>");
            sb.Append("            </td>");
            sb.Append("            <td style='background-color: #FFFFFC; width: 90%; font-size: 11px; font-family: Verdana, Tahoma;'>");
            sb.Append("            " + user.Senha);
            sb.Append("            </td>");
            sb.Append("        </tr>");
            sb.Append("        <tr>");
            sb.Append("            <td colspan='2' align='center' style='font-size: 10px; font-family: Verdana, Tahoma;'>");
            sb.Append("                <span style='color: Gray'>Caso você não tenha solicitado este e-mail, informar o adiministrador");
            sb.Append("                    do site Lé Com Cré</span>");
            sb.Append("            </td>");
            sb.Append("        </tr>");
            sb.Append("    </table>");
            sb.Append("</body>");
            sb.Append("</html>");


            return sb.ToString();
        }
    }
}
