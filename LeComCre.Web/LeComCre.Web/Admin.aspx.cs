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
    public partial class Admin : pageBaseSecurity
    {

        public bool popupInfoUser
        {
            get { return (ViewState["popupInfoUser"] != null ? (bool)ViewState["popupInfoUser"] : false ); }
            set { ViewState["popupInfoUser"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Verificar se é um Adiministrador
                if (isLogado & UsuarioLogado.Tipo_Usuario.Tipo_Usuario_id == 1)
                {
                    GridViewJogos.DataBind();
                    GridViewColorir.DataBind();
                    GridViewAssuntos.DataBind();
                    GridViewPagina.DataBind();
                    GridViewConteudoAssunto.DataBind();
                    GridViewTemas.DataBind();
                    GridViewUsuario.DataBind();
                    GridViewUsuarioAcessoPaginas.DataBind();
                    GridViewUsuarioHistoricoBatePapo.DataBind();
                }
                else
                {
                    Alert("Usuario não é o administrador para acessar essa pagina.", "Default.aspx");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message, "Default.aspx");
                LogarErro("(Admin.aspx) - Page_Load", ex);
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
                int idUsuario = int.Parse(e.CommandArgument.ToString());
                popupInfoUser = false;
                if (e.CommandName == "Select")
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanelUsuarios, UpdatePanelUsuarios.GetType(), "InfoUsuario", "OpenInfoUser();", true);
                }
                if (e.CommandName == "Aprov")
                {
                    new NegUsuario().setUsuarioById(idUsuario, 1);
                    GridViewUsuario.DataBind();
                } if (e.CommandName == "Reprov")
                {
                    new NegUsuario().setUsuarioById(idUsuario, 0);
                    GridViewUsuario.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewUsuario_RowCommand", ex);
            }
        }

        protected void GridViewAssuntos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idAssunto = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Aprov")
                {
                    new LeComCre.Web.Negocios.Assuntos().setAssuntoById(idAssunto, 1);
                    GridViewAssuntos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewAssuntos_RowCommand", ex);
            }
        }

        protected void GridViewConteudoAssunto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idConteudoAssunto = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Aprov")
                {
                    new LeComCre.Web.Negocios.Assuntos().setConteudoAssuntoById(idConteudoAssunto, 1);
                    GridViewConteudoAssunto.DataBind();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - GridViewConteudoAssunto_RowCommand", ex);
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
                LogarErro("(Admin.aspx) - btnPaginaBuscar_Click", ex);
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
                LogarErro("(Admin.aspx) - btnUsuarioBuscar_Click", ex);
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
                new Aplicativos().newColorir(txtCadastrarColorirNome.Text, txtCadastrarColorirUrl.Text, txtCadastrarColorirEvento.Text);
                GridViewColorir.DataBind();
                Alert("Operação realizada com sucesso.");
                txtCadastrarColorirNome.Text = string.Empty;
                txtCadastrarColorirUrl.Text = string.Empty;
                txtCadastrarColorirEvento.Text = string.Empty;
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnCadastrarColorir_Click", ex);
            }
        }

        protected void btnCadastrarJogo_Click(object sender, EventArgs e)
        {
            try
            {
                new Aplicativos().newJogo(txtCadastrarNomeJogo.Text, txtCadastrarUrlJogo.Text, txtCadastrarEventoJogo.Text);
                GridViewJogos.DataBind();
                Alert("Operação realizada com sucesso.");
                txtCadastrarNomeJogo.Text = string.Empty;
                txtCadastrarUrlJogo.Text = string.Empty;
                txtCadastrarEventoJogo.Text = string.Empty;
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Admin.aspx) - btnCadastrarColorir_Click", ex);
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
    }
}
