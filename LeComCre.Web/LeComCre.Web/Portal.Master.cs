using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeComCre.Web
{
    public partial class Portal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ToolkitScriptManager1_AsyncPostBackError( object sender, AsyncPostBackErrorEventArgs e )
        {
            ToolkitScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
        }

    }
}
