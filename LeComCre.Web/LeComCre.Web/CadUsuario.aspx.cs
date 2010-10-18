using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web
{
    public partial class CadUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string op = (!string.IsNullOrEmpty(Request.QueryString["op"]) ? Request.QueryString["op"].ToLower() : "");
                
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(op) && Utils.isNumeric(op))
                    {
                        DivCrianca.Style["display"] = "none";
                        DivAdulto.Style["display"] = "none";
                        DivProficional.Style["display"] = "none";

                        int i = int.Parse(op);
                        switch (i)
                        {
                            case 1:
                                DivCrianca.Style["display"] = "block";
                                break;
                            case 2:
                                DivAdulto.Style["display"] = "block";
                                break;
                            case 3:
                                DivProficional.Style["display"] = "block";
                                break;
                            default:
                                Response.Redirect("~/Cadastrar.aspx", true);
                                break;
                        }
                        
                    }
                    else
                    {
                        Response.Redirect("~/Cadastrar.aspx", true);
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("~/Cadastrar.aspx", true);
            }
        }
    }
}
