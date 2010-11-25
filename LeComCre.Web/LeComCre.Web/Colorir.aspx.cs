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
                if ( !IsPostBack )
                {
                    RepeaterColorir.DataBind();
                    string op = Request.QueryString[ "p" ] == null ? "" : Request.QueryString[ "p" ];
                    if ( !string.IsNullOrEmpty( op ) && Utils.isNumeric( op ) )
                    {
                        HabilitarIMG( int.Parse( op ) );

                    } else
                    {
                        Random rd = new Random();
                        int idx = rd.Next( RepeaterColorir.Items.Count ) + 1;
                        HabilitarIMG( idx );
                    }
                }

                ( ( MasterColorir )this.Master ).setUsuario = getNomeUsuarioLogado;


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
                HabilitarIMG( idColorir );

            }
        }

        private void HabilitarIMG( int idColorir )
        {
            DataSet ds = new Aplicativos().getColorirById( idColorir );

            lblTitle.Text = Utils.GetString( ds.Tables[ 0 ].Rows[ 0 ], "descricao" );
            imgDownload.ImageUrl = string.Format( "~/conteudo/Colorir/{0}", Utils.GetString( ds.Tables[ 0 ].Rows[ 0 ], "url" ) );
            imgDownload.Width = new Unit( 300, UnitType.Pixel );
            imgDownload.Height = new Unit( 300, UnitType.Pixel );
            ViewState[ "img" ] = imgDownload.ImageUrl;
            CorpoColorir.Style[ "display" ] = "block";

            string sPath = string.Format( "http://{0}/{1}", Request.ServerVariables[ "SERVER_NAME" ], ViewState[ "img" ].ToString().Replace( "~", "" ) );
            imgPrint.Attributes[ "onclick" ] = "popImage('" + sPath + "');";
        }
    }
}
