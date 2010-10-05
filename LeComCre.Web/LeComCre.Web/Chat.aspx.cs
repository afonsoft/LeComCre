using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using Afonsoft.Libary.Chat;
using Afonsoft.Libary.Data;
using LeComCre.Web.PageBase;
using AjaxControlToolkit;

namespace Afonsoft.Web.Chat
{
    public partial class _Chat : pageBaseSecurity
    {
        protected void ToolkitScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
        {
            ToolkitScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string p = (ViewState["Parametro"] != null ? ViewState["Parametro"].ToString() : "");

            if (!IsPostBack)
            {
                ViewState.Add("TotalUser", 0);
                ViewState["Parametro"] = null;
                ViewState["UserInfo"] = null;
                ViewState["Atualizar"] = true;
                TimerMensagem.Enabled = false;
                TimerPara.Enabled = false;
                MainChat.Style["display"] = "none";
                btnLogar_Click(sender, e);
               
            }

            
            if (!String.IsNullOrEmpty(p))
            {
              
            }
            Page.Validate();
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            if (isLogado)
            {
                string usuario = ((LeComCre.Web.Negocios.Usuario)UsuarioLogado).Apelido;
                string crypt = "";
                try
                {
                    crypt = Encryption.Criptografar(usuario + "|" + String.Format("{0:dd/MM/yyyy HH:mm:ss}", DateTime.Now) + "|" + Request.UserHostAddress + "|" + Guid.NewGuid().ToString());
                }
                catch (Exception) { }
                ViewState.Add("Parametro", crypt);
                Usuario user = new Usuario() { UserName = usuario, DtLogin = DateTime.Now, IpUser = Request.UserHostAddress, Ativo = true, Codigo = crypt, SessionId = Guid.NewGuid().ToString() };
                try
                {
                    ChatDAL.CreateUserChatSession(user);
                    ViewState["UserInfo"] = user;
                    lstUsuarios.DataSource = getUsers();
                    lstUsuarios.DataBind();
                    ViewState.Add("TotalUser", 0);
                    ViewState.Add("TotalMsg", 0);
                    MainChat.Style["display"] = "block";
                    AtualizarMensagem(true);
                    TimerMensagem.Enabled = true;
                    TimerMensagem.Interval = 5000;
                    TimerPara.Enabled = true;
                }
                catch (Exception) { }
            }
        }

        
        private List<Usuario> getUsers()
        {
            return ChatDAL.getUser();
        }

        public void AtualizarUser()
        {
            List<Usuario> lstUser = null;
            try
            {
                int i = lstUsuarios.SelectedIndex;
                lstUser = getUsers();
                bool dif = (lstUser.Count != int.Parse(ViewState["TotalUser"].ToString()));
                if (dif)
                {
                    lstUsuarios.DataSource = lstUser;
                    lstUsuarios.DataBind();
                    lstUsuarios.SelectedIndex = i;
                    ViewState.Add("TotalUser", lstUser.Count);
                }
                if (ViewState["ParaUser"] != null)
                    lblReservado.Text = ViewState["ParaUser"].ToString();
                else
                    lblReservado.Text = "Todos";
            }
            catch (Exception)
            {
                ViewState.Add("TotalUser", 0);
                lblReservado.Text = "Todos";
            }
            finally
            {
                lstUser = null;
            }
        }

        protected void TimerMensagem_Tick(object sender, EventArgs e)
        {
            try
            {
                if (((bool)ViewState["Atualizar"]) == true)
                {
                    ViewState["Atualizar"] = false;
                    AtualizarMensagem(true);
                    ViewState["Atualizar"] = true;
                }
            }
            catch (Exception){}
        }

        private void AtualizarMensagem(bool? atualizar)
        {
            List<Mensagem> lstMsg = null;
     
            if(atualizar.HasValue && atualizar.Value)
            {
                lstMsg = ChatDAL.getMensagens((Usuario)ViewState["UserInfo"]);
                GridMensagem.DataSource = lstMsg;
                GridMensagem.DataBind();                
            }
            AtualizarUser();
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtMensagem.Text="";
            lblReservado.Text="";
            chkReservado.Checked = false;
            ViewState["ParaUser"] = null;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            ViewState["Atualizar"] = false;
            Mensagem msg = new Mensagem() { De = ((Usuario)ViewState["UserInfo"]).UserName, DtMensagem = DateTime.Now, Para = lblReservado.Text, HtmlMensagem = txtMensagem.Text, Reservado = chkReservado.Checked };
            try
            {
                ChatDAL.AddMensagem(msg);
                btnLimpar_Click(sender, e);
                ViewState.Add("TotalUser", 0);
                ViewState["Atualizar"] = true;
                AtualizarMensagem((bool?)ViewState["Atualizar"]);
            }
            catch (Exception)
            {
                btnEnviar_Click(sender, e);
                TimerMensagem.Enabled = true;
            }
        }

        protected void lstUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string User = e.CommandArgument.ToString();
            ViewState.Add("ParaUser", User);
        }

        protected void TimerPara_Tick(object sender, EventArgs e)
        {
            if (ViewState["ParaUser"] != null)
                lblReservado.Text = ViewState["ParaUser"].ToString();
            else
                lblReservado.Text = "Todos";
        }

        protected void linkSair_Click(object sender, EventArgs e)
        {
            ViewState.Add("TotalUser", 0);
            ViewState["Parametro"] = null;
            ViewState["Atualizar"] = false;
            TimerMensagem.Enabled = false;
            TimerPara.Enabled = false;
            ChatDAL.RemoveUserChatSession((Usuario)ViewState["UserInfo"]);
            ViewState["UserInfo"] = null;
            Response.Redirect("~/Default.aspx", true);
        }

    }
}
