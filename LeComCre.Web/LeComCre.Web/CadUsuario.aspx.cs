using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Utilities;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;

namespace LeComCre.Web
{
    public partial class CadUsuario : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string op = (!string.IsNullOrEmpty(Request.QueryString["op"]) ? Request.QueryString["op"].ToLower() : "");
                
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(op) && Utils.isNumeric(op))
                    {
                        DivCrianca.Style["display"] = "none";
                        DivAdulto.Style["display"] = "none";
                        DivProficional.Style["display"] = "none";

                        int i = int.Parse(op);
                        switch (i)
                        {
                            case 1:
                                DivCrianca.Style["display"] = "block";
                                break;
                            case 2:
                                DivAdulto.Style["display"] = "block";
                                break;
                            case 3:
                                DivAdulto.Style["display"] = "block";
                                DivProficional.Style["display"] = "block";
                                break;
                            default:
                                Response.Redirect("~/Cadastrar.aspx", true);
                                break;
                        }
                        ViewState["TipoUsuario"] = i;
                    }
                    else
                    {
                        Response.Redirect("~/Cadastrar.aspx", true);
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/Cadastrar.aspx", true);
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                ValidarDados();
                Usuario user = PopularUsuario();
                new NegUsuario().IncluirUsuario(user);
            }
            catch (Exception ex) { Alert(ex.Message); }
                
        }

        private Usuario PopularUsuario()
        {
            Usuario u = new Usuario();
            u.Usuario_Proficional = new Usuario_Proficional();
            u.Usuario_Pai = new Usuario_Pai();
            u.Usuario_Filha = new Usuario_Filha();
            u.TpUsuario = (tpUsuario)ViewState["TipoUsuario"];

            u.Apelido = txtApelido.Text.Trim();
            u.DtNascimento = DateTime.Parse(txtDataNascimento.Text);
            u.EMail = txtEMail.Text.Trim();
            u.Nome = txtNome.Text.Trim(); 
            u.Senha = txtSenha.Text.Trim();
            u.SobreNome = txtSobreNome.Text.Trim();
            u.Usuario_Pai.CPF = (String.IsNullOrEmpty(txtCPF.Text.Trim()) ? txtCPFResponsavel.Text.Trim() : txtCPF.Text.Trim());
            u.Usuario_Filha.Nome_Escola = txtNomeEscola.Text.Trim();
            u.Usuario_Filha.Nome_Mae = txtNomeMae.Text.Trim();
            u.Usuario_Filha.Nome_Pai = txtNomePai.Text.Trim();
            u.Usuario_Filha.Serie = txtSerieEscola.Text.Trim();
            u.Usuario_Proficional.Area = (rdAtuacaoNenhuma.Checked ? "Nenhuma" : (rdAtuacaoPrivada.Checked ? "Privada" : (rdAtuacaoPublica.Checked ? "Publica" : "")));
            u.Usuario_Filha.Publica = (rdPublica.Checked ? 1 : 0);
            u.Usuario_Proficional.Profissao = (rdPedagogo.Checked ? "Pedagogo" : (rdPisicologo.Checked ? "Pisicologo" : (rdFonoaudiologo.Checked ? "Fonoaudiologo" : (rdOutros.Checked ? txtOutraProfissao.Text.Trim() : ""))));

            return u;
        }

        private void ValidarDados()
        {
            throw new NotImplementedException();
        }
    }
}
