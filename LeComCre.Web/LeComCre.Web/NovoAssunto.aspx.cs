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
    public partial class NovoAssunto : pageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = UsuarioLogado;
                if (isLogado)
                {
                    assunto InfoAssunto = new assunto();
                    InfoAssunto.Usuario = UsuarioLogado;
                    InfoAssunto.Ativo = 0;
                    InfoAssunto.Usuario_id = UsuarioLogado.Usuario_id;
                    InfoAssunto.Assunto = txtAssunto.Text;
                    InfoAssunto.Descricao = txtDesc.Text;

                    new LeComCre.Web.Negocios.Assuntos().setNewAssunto(InfoAssunto);
                    Alert("Sua solicitação foi enviado ao moderador\n e será analisada antes de ser liberada!");
                    txtAssunto.Text = string.Empty;
                    txtDesc.Text = string.Empty;
                    JavaScript("window.location.href='Assuntos.aspx'");
                }
                else
                {
                    Alert("Usuario não logado no sistema."); JavaScript("window.location.href='Login.aspx?p=NovoAssunto.aspx'");
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
            }
        }
    }
}
