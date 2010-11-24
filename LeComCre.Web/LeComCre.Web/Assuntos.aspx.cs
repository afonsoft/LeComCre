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
    public partial class Assuntos : pageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                RepeaterAssunto.DataBind();
                ( ( MasterTemas )this.Master ).setUsuario = getNomeUsuarioLogado;
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Assuntos.aspx) - Page_Load", ex);
            }
        }

        protected void btnBuscarAssunto_Click(object sender, EventArgs e)
        {
            try
            {
                RepeaterAssunto.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Assuntos.aspx) - btnBuscarAssunto_Click", ex);
            }
        }
    }
}
