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
    public partial class Tema : pageBase
    {
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
                        }
                        catch (Exception ex)
                        {
                            throw new Exception("Parametros invalidos.", ex);
                        }
                    }
                    else
                        throw new Exception("Parametros invalidos.");

                    string ConteudoTema = new Temas().getTemaById(idTema);

                    if (EditTema)
                    {
                        TemaHTML.Style["display"] = "none";
                        EditTemaHTML.Style["display"] = "block";
                        Editor1.Content = ConteudoTema;
                    }
                    else
                    {
                        TemaHTML.Style["display"] = "block";
                        EditTemaHTML.Style["display"] = "none";
                        TemaHTML.InnerHtml = ConteudoTema;
                    }

                }
            }
            catch (Exception ex)
            {

                Alert(ex.Message);
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            
        }
    }
}
