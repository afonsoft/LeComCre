using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeComCre.Web.UserControl
{
    public partial class ucAssunto : System.Web.UI.UserControl
    {
        public string Titulo
        {
            get { return lblTitulo.Text; }
            set { lblTitulo.Text = value; }
        }
        public string Desc
        {
            get { return lblAssunto.Text; }
            set { lblAssunto.Text = value; }
        }
        public string OnClick
        {
            get { return lnkAssunto.Attributes["OnClick"].Replace("~/InfoAssunto.aspx?p=", ""); }
            set { lnkAssunto.Attributes["OnClick"] = "~/InfoAssunto.aspx?p=" + value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}