using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeComCre.Web.PageBase;
using System.Data;
using LeComCre.Web.Negocios;
using Afonsoft.Libary.Utilities;
using System.IO;
using Afonsoft.Libary.MimeType;

namespace LeComCre.Web
{
    public partial class Colorir : pageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                    RepeaterColorir.DataBind();
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Colorir.aspx) - Page_Load", ex);
            }
        }

        protected void imgDownload_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (ViewState["img"] != null)
                {

                    string sPath = Server.MapPath(ViewState["img"].ToString());

                    Response.Clear();
                    Response.Buffer = true;
                    Response.BufferOutput = true;

                    Response.ContentType = "image/jpeg";
                    FileStream myFileStream = new FileStream(sPath, FileMode.Open);
                    long FileSize = myFileStream.Length;
                    byte[] Buffer = new byte[(int)FileSize];
                    myFileStream.Read(Buffer, 0, (int)FileSize);
                    myFileStream.Close();

                    Response.AddHeader("Content-Length", FileSize.ToString());
                    Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}; size={1};", sPath, FileSize.ToString()));
                    Response.ContentType = MimeTypeUtil.CheckType(sPath);

                    Response.BinaryWrite(Buffer);
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Colorir.aspx) - imgDownload_Click", ex);
            }
        }

        protected void RepeaterColorir_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int idColorir = int.Parse(e.CommandArgument.ToString());

            lblTitle.Text = string.Empty;
            CorpoColorir.Style["display"] = "none";
            ViewState["img"] = string.Empty;

            if (e.CommandName == "View")
            {
                DataSet ds = new Aplicativos().getColorirById(idColorir);

                lblTitle.Text = Utils.GetString(ds.Tables[0].Rows[0], "descricao");
                imgDownload.ImageUrl = string.Format("~/conteudo/Colorir/{0}", Utils.GetString(ds.Tables[0].Rows[0], "url"));
                ViewState["img"] = imgDownload.ImageUrl;
                CorpoColorir.Style["display"] = "block";

            }
        }

        protected void imgPrint_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (ViewState["img"] != null)
                {
                    string sPath = string.Format("http://{0}/{1}", Request.ServerVariables["SERVER_NAME"], ViewState["img"].ToString().Replace("~", "")); //.MapPath(ViewState["img"].ToString());
                    //newwindow=window.open(url,'htmlname','width=auto,height=auto,resizable=1'); newwindow.print();newwindow.close();
                    string script = string.Format("newwindow=window.open('{0}','_blank','width=400,height=300,resizable=1,scrollbars=yes'); newwindow.document.writeln('<script>window.print();</script>');", sPath);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Download", script, true);
                }
            }
            catch (Exception ex)
            {
                Alert(ex.Message);
                LogarErro("(Colorir.aspx) - imgPrint_Click", ex);
            }
        }  
    }
}
