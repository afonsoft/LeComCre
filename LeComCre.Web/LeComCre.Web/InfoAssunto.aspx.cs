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
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Parametros invalidos.", ex);
                    }
                }
                else
                    throw new Exception("Parametros invalidos.");

                LeComCre.Web.Negocios.assunto InfoAssunto = new LeComCre.Web.Negocios.Assuntos().getAssuntoById(idAssunto);

            }
        }
    }
}
