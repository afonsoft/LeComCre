using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using Afonsoft.Libary.Data;
using LeComCre.Web.Negocios;

namespace LeComCre.Web.PageBase
{
    public class pageBase : System.Web.UI.Page
    {

        #region UsuarioLogado
        public Usuario UsuarioLogado
        {
            get 
            {
                return (Session["UsuarioLogado"] != null ? (Usuario)Session["UsuarioLogado"] : null);
            }
        }

        public bool isLogado
        {
            get
            {
                return (Session["UsuarioLogado"] != null ? true : false);
            }
        }
        #endregion

    }
}
