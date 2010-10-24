﻿using System;
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
    public partial class Tema : pageBase
    {
        public bool NovoTema{
            get { return (ViewState["NovoTema"] != null ? ((bool)ViewState["NovoTema"]) : false); }
            set { ViewState["NovoTema"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string[] op;
                int idTema = 0;
                bool EditTema = false;
                
                if (!IsPostBack)
                {
                    if (Request.QueryString["p"] != null)
                    {
                        try
                        {
                            op = Encryption.Descriptografar(Request.QueryString["p"]).Split('|');
                            idTema = int.Parse(op[0]);
                            EditTema = (op[1] == "1" ? true : false);
                            NovoTema = (op[1] == "2" ? true : false);
                            
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Parametros invalidos.", ex);
                        }
                    }
                    else
                        throw new Exception("Parametros invalidos.");
                    if (!NovoTema)
                    {
                        tema ConteudoTema = new Temas().getTemaById(idTema);

                        if (EditTema)
                        {
                            TemaHTML.Style["display"] = "none";
                            EditTemaHTML.Style["display"] = "block";
                            Editor1.Content = ConteudoTema.Texto;
                            txtDescricao.Text = ConteudoTema.Descricao;
                            txtTitulo.Text = ConteudoTema.Tema;
                        }
                        else
                        {
                            TemaHTML.Style["display"] = "block";
                            EditTemaHTML.Style["display"] = "none";
                            lblTitulo.Text = ConteudoTema.Tema;
                            TextoHTML.InnerHtml = ConteudoTema.Texto;
                            txtDataEvento.Text = ConteudoTema.DtEvento;
                        }
                    }
                    else
                    {
                        TemaHTML.Style["display"] = "none";
                        EditTemaHTML.Style["display"] = "block";
                    }

                }
            }
            catch (Exception ex)
            {

                Alert(ex.Message);
                LogarErro("(Tema.aspx) - Page_Load", ex);
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                tema t = new tema();
                t.Descricao = txtDescricao.Text;
                t.Tema = txtTitulo.Text;
                t.Texto = Editor1.Content;
                t.DtEvento = txtDataEvento.Text;
                string pg = (Request.QueryString["rtl"] != null ? Request.QueryString["rtl"] : "temas.aspx");
                Temas ts = new Temas();
                if (NovoTema)
                {
                    ts.setNewTema(t);
                    Alert("Inclusão do novo tema realizada com sucesso!", pg);
                }
                else
                {
                    ts.setTemaById(t);
                    Alert("Alteração realizada com sucesso!", pg);
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message, "Default.aspx");
                LogarErro("(Tema.aspx) - btnSalvar_Click", ex);
            }
        }
    }
}
