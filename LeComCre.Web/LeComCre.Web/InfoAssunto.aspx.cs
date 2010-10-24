using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;

namespace LeComCre.Web
{
    public partial class InfoAssunto : pageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string op;
                int idAssunto = 0;
                if (!IsPostBack)
                {
                    if (Request.QueryString["p"] != null)
                    {
                        try
                        {
                            op = Encryption.Descriptografar(Request.QueryString["p"]);
                            idAssunto = int.Parse(op);
                            HiddenFieldAssuntoId.Value = idAssunto.ToString();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Parametros invalidos.", ex);
                        }
                    }
                    else
                        throw new Exception("Parametros invalidos.");

                    LeComCre.Web.Negocios.assunto InfoAssunto = new LeComCre.Web.Negocios.Assuntos().getAssuntoById(idAssunto, 1);
                    lblTitle.Text = InfoAssunto.Assunto;
                    lblUser.Text = InfoAssunto.Usuario.Apelido;
                    lblDesc.Text = InfoAssunto.Descricao;
                    ObjectDataSourceAssunto.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(InfoAssunto.aspx) - Page_Load", ex);
            }
        }

        protected void btnEnviarComentario_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = UsuarioLogado;
                if (isLogado)
                {
                    conteudo_assunto ConteudoAssunto = new conteudo_assunto();
                    ConteudoAssunto.Usuario = UsuarioLogado;
                    ConteudoAssunto.Usuario_id = UsuarioLogado.Usuario_id;
                    ConteudoAssunto.Assunto_id = int.Parse(HiddenFieldAssuntoId.Value);
                    ConteudoAssunto.Ativo = 0;
                    ConteudoAssunto.Comentario = txtComentar.Text;

                    new LeComCre.Web.Negocios.Assuntos().setNewConteudoAssunto(ConteudoAssunto);
                    Alert("Sua solicitação foi enviado ao moderador\n e será analisada antes de ser liberada!", "Assuntos.aspx");
                    txtComentar.Text = string.Empty;
                }
                else 
                {
                    Alert("Usuario não logado no sistema.", "Assuntos.aspx"); 
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(InfoAssunto.aspx) - btnEnviarComentario_Click", ex);
            }
        }
    }
}
