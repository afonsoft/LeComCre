using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeComCre.Web.UserControl
{
    public partial class ucTemaSimples : System.Web.UI.UserControl
    {

        
        public string idTema
        {
            get { return HiddenCodigo.Value; }
            set { HiddenCodigo.Value = value; }
        }
        public string Desc
        {
            get { return lblDescricao.Text; }
            set { lblDescricao.Text = value; }
        }
        public string Title
        {
            get { return lblTitle.Text; }
            set { lblTitle.Text = value; }
        }
        public string LinkDetalhe
        {
            get { return lnkButtonDetalhe.HRef; }
            set { lnkButtonDetalhe.HRef = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}