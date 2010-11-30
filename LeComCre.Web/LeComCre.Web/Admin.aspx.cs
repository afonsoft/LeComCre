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
using AjaxControlToolkit.Design;
using System.IO;

namespace LeComCre.Web
{
    public partial class Admin : pageBaseSecurity
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Verificar se é um Adiministrador
                if ( !isLogado || UsuarioLogado.Tipo_Usuario.Tipo_Usuario_id != 1 )
                    Response.Redirect( "AcessoNegado.aspx?Pagina=Admin.aspx" );
                
                if(!IsPostBack)
                    afu_UploadFile.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(afu_UploadFile_UploadedComplete); 
            }
            catch (Exception ex)
            {
                Alert(ex.Message, "Default.aspx");
                LogarErro("(Admin.aspx) - Page_Load: " + ex.Message, ex);
            } 
        }

        protected void GridViewTemas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idTema = int.Parse(e.CommandArgument.ToString());
            string pag = "~/Tema.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(idTema + "|1")+ "&rtl=admin.aspx";
            Response.Redirect(pag, true);
        }

        protected void GridViewUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DetailsViewInfoUsuario.DataBind();
                int idUsuario = int.Parse(e.CommandArgument.ToString());
                Usuario u = new NegUsuario().getUsuarioById( idUsuario );
                
                if (e.CommandName == "Select")
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanelUsuarios, UpdatePanelUsuarios.GetType(), "InfoUsuario", "OpenInfoUser();", true);
                }
                if (e.CommandName == "Aprov")
                {
                    new NegUsuario().setUsuarioById(idUsuario, 1);
                    Mail.SendMail( u.EMail, "Portal Educativo Lé Com Cré", "Usuario Aprovado pelo Administrador do Portal." );
                } if (e.CommandName == "Reprov")
                {
                    new NegUsuario().setUsuarioById(idUsuario, 0);
                    Mail.SendMail( u.EMail, "Portal Educativo Lé Com Cré", "Usuario Bloqueado pelo Administrador do Portal." );
                }

            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewUsuario_RowCommand: " + ex.Message, ex);
            }
        }

        protected void GridViewAssuntos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idAssunto = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Aprov")
                {
                    LeComCre.Web.Negocios.Assuntos ass = new LeComCre.Web.Negocios.Assuntos();
                    ass.setAssuntoById(idAssunto, 1);
                    GridViewAssuntos.DataBind();
                    try
                    {
                        assunto a = ass.getAssuntoById( idAssunto, 1 );
                        Mail.SendMail( a.Usuario.EMail, "Portal Educativo Lé Com Cré", "Assunto do Forum liberado pelo Administrador do Portal." );
                    } catch ( Exception ) { } finally { ass = null; }
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewAssuntos_RowCommand: " + ex.Message, ex);
            }
        }

        protected void GridViewConteudoAssunto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idConteudoAssunto = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Aprov")
                {
                    LeComCre.Web.Negocios.Assuntos ass = new LeComCre.Web.Negocios.Assuntos();
                    ass.setConteudoAssuntoById( idConteudoAssunto, 1 );
                    GridViewConteudoAssunto.DataBind();
                    try
                    {
                        conteudo_assunto ca = ass.getConteudoById( idConteudoAssunto );
                        assunto assunto = ass.getAssuntoById( ca.Assunto_id, 1 );
                        Mail.SendMail( ca.Usuario.EMail, "Portal Educativo Lé Com Cré", "Comentario do Forum liberado pelo Administrador do Portal." );
                        Mail.SendMail( assunto.Usuario.EMail, "Portal Educativo Lé Com Cré", "Foi efetuado um comentário no seu Forum." );
                    } catch ( Exception ) { }
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewConteudoAssunto_RowCommand: " + ex.Message, ex);
            }
        }
        protected void btnPaginaBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.DataSet ds = new NegUsuario().getHistoricoPagina(txtPaginaNome.Text, txtUsuarioDe.Text, txtUsuarioAte.Text);
                Session.Add("dsHistoricoPagina", ds);
                GridViewPagina.DataSource = ds;
                GridViewPagina.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnPaginaBuscar_Click: " + ex.Message, ex);
            }
        }
        protected void btnUsuarioBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.DataSet ds = new NegUsuario().getHistoricoUsuario(txtUsuarioMail.Text, txtUsuarioDe.Text, txtUsuarioAte.Text);
                Session.Add("dsHistoricoUsuario", ds);
                GridViewUsuarioAcessoPaginas.DataSource = ds.Tables[0];
                GridViewUsuarioHistoricoBatePapo.DataSource = ds.Tables[1];
                
                GridViewUsuarioAcessoPaginas.DataBind();
                GridViewUsuarioHistoricoBatePapo.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnUsuarioBuscar_Click: " + ex.Message, ex);
            }
        }

        #region PageIndexChanging

        protected void GridViewPagina_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ((GridView)sender).PageIndex = e.NewPageIndex;
            ((GridView)sender).DataSource = ((System.Data.DataSet)Session["dsHistoricoPagina"]);
            ((GridView)sender).DataBind();
        }

        protected void GridViewUsuarioHistoricoBatePapo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
              ((GridView)sender).PageIndex = e.NewPageIndex;
            ((GridView)sender).DataSource = ((System.Data.DataSet)Session["dsHistoricoUsuario"]).Tables[1];
            ((GridView)sender).DataBind();
        }

        protected void GridViewUsuarioAcessoPaginas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
              ((GridView)sender).PageIndex = e.NewPageIndex;
            ((GridView)sender).DataSource = ((System.Data.DataSet)Session["dsHistoricoUsuario"]).Tables[0];
            ((GridView)sender).DataBind();
        }

        #endregion

        #region Buscar Usuario aprov, buscar historico batepapo

        protected void btnBuscarUsuarioAprov_Click(object sender, EventArgs e)
        {
            ObjectDataSourceUsuario.DataBind();
        }
        protected void btnBateBuscar_Click(object sender, EventArgs e)
        {
            GridViewHistoricoPapoUser.DataBind();
        }

        #endregion

        protected void btnCadastrarColorir_Click(object sender, EventArgs e)
        {
            try
            {
                if ( String.IsNullOrEmpty( txtCadastrarColorirNome.Text ) || string.IsNullOrEmpty( txtCadastrarColorirUrl.Text ) || string.IsNullOrEmpty( txtCadastrarColorirEvento.Text ) )
                {
                    Alert( "Favor preencher todos os dados da tela." );
                } else
                {
                    new Aplicativos().newColorir( txtCadastrarColorirNome.Text, txtCadastrarColorirUrl.Text, txtCadastrarColorirEvento.Text );
                    GridViewColorir.DataBind();
                    Alert( "Operação realizada com sucesso." );
                    txtCadastrarColorirNome.Text = string.Empty;
                    txtCadastrarColorirUrl.Text = string.Empty;
                    txtCadastrarColorirEvento.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnCadastrarColorir_Click: " + ex.Message, ex);
            }
        }

        protected void btnCadastrarJogo_Click(object sender, EventArgs e)
        {
            try
            {
                if ( String.IsNullOrEmpty( txtCadastrarNomeJogo.Text ) || string.IsNullOrEmpty( txtCadastrarUrlJogo.Text ) || string.IsNullOrEmpty( txtCadastrarEventoJogo.Text ) )
                {
                    Alert( "Favor preencher todos os dados da tela." );
                } else
                {
                    new Aplicativos().newJogo( txtCadastrarNomeJogo.Text, txtCadastrarUrlJogo.Text, txtCadastrarEventoJogo.Text );
                    GridViewJogos.DataBind();
                    Alert( "Operação realizada com sucesso." );
                    txtCadastrarNomeJogo.Text = string.Empty;
                    txtCadastrarUrlJogo.Text = string.Empty;
                    txtCadastrarEventoJogo.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnCadastrarColorir_Click: " + ex.Message, ex);
            }
        }

        #region GridViewJogos_RowCommand GridViewColorir_RowCommand

        protected void GridViewJogos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idJogo = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Excluir")
                {
                    new LeComCre.Web.Negocios.Aplicativos().deleteJogoById(idJogo);
                    GridViewJogos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewJogos_RowCommand", ex);
            }
        }
        protected void GridViewColorir_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idColorir = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Excluir")
                {
                    new LeComCre.Web.Negocios.Aplicativos().deleteColorirById(idColorir);
                    GridViewColorir.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewColorir_RowCommand", ex);
            }
        }

        #endregion 

        protected void afu_UploadFile_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
            try
            {
                string pt = (HiddenFieldPath.Value == "" ? "/" : "/" + HiddenFieldPath.Value + "/");
                if (afu_UploadFile.HasFile)
                {
                    string savePath = MapPath("~/conteudo" + pt + Path.GetFileName(e.filename));
                    ((AjaxControlToolkit.AsyncFileUpload)sender).SaveAs(savePath);
                    System.Threading.Thread.Sleep( 100 );
                    ((AjaxControlToolkit.AsyncFileUpload)sender).ClearFileFromPersistedStore();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro( "(Admin.aspx) - afu_UploadFile_UploadedComplete: " + ex.Message, ex );
            }
        }
    }
}
