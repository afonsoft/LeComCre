using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using Afonsoft.Libary.MimeType;
using LeComCre.Web.PageBase;

namespace LeComCre.Web
{
    public partial class FileManager : pageBaseSecurity
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CurrentNodeValuePath = this.fileSystemDataSource.RootPath;
                this.lvItems.DataSource = new System.IO.DirectoryInfo(System.IO.Path.Combine(HttpContext.Current.Server.MapPath(this.Request.ApplicationPath), this.fileSystemDataSource.RootPath)).GetFileSystemInfos();
                this.lvItems.DataBind();
            }
        }


        /// <summary>
        /// Keep track of the value path to the currently
        /// selected node so we can look it up as needed
        /// </summary>
        private string CurrentNodeValuePath
        {
            get { return this.ViewState["CurrentNodeValuePath"] as string; }
            set { this.ViewState["CurrentNodeValuePath"] = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void ItemDataBound(object sender, ListViewItemEventArgs args)
        {
            ListViewDataItem dataItem = args.Item as ListViewDataItem;
            if (dataItem != null)
            {
                ImageButton imageButton = (ImageButton)dataItem.FindControl("btnItemIcon");
                LinkButton linkButton = (LinkButton)dataItem.FindControl("btnItemName");

                if (dataItem.DataItem is System.IO.DirectoryInfo)
                {
                    //  this is a folder, assign the correct commands
                    //  and images
                    imageButton.ImageUrl = @"~/images/folder.gif";
                    imageButton.CommandName = "OpenFolder";
                    linkButton.CommandName = "OpenFolder";
                }
                else if (dataItem.DataItem is System.IO.FileInfo)
                {
                    System.IO.FileInfo fileInfo = (System.IO.FileInfo)dataItem.DataItem;

                    imageButton.CommandName = "OpenFile";
                    linkButton.CommandName = "OpenFile";

                    // register both the linkbutton and imagebutton as full postback
                    // controls.  
                    ScriptManager scriptManager = ScriptManager.GetCurrent(Parent.Page);
                    scriptManager.RegisterPostBackControl(linkButton);
                    scriptManager.RegisterPostBackControl(imageButton);

                    // calculate the file's size

                    Label lblSize = (Label)dataItem.FindControl("lblSize");
                    Label lblType = (Label)dataItem.FindControl("lblType");
                    string Type = MimeTypeUtil.CheckType(fileInfo.FullName);

                    //  this is a file, assign the correct commands
                    //  and images  
                    string mime = Type.Substring(0, Type.IndexOf("/"));
                    string ext = Type.Substring(Type.IndexOf("/") + 1, Type.Length - Type.IndexOf("/") - 1);
                    switch (mime)
                    {
                        case "video":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "application":
                            if (ext.ToLower().Contains("compress"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("octet-stream"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("msword"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("mspowerpoint"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("ms"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("bzip"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("gzip"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("zip"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else if (ext.ToLower().Contains("pdf"))
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            else
                                imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "audio":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "music":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "text":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "image":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "x-world":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "x-conference":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "model":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "i-world":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "message":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        case "x-music":
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                        default:
                            imageButton.ImageUrl = @"~/images/pdf.gif";
                            break;
                    }

                    lblType.Text = Type;//Type.Replace("image/", "").Replace("image/", "").Replace("video/", "").Replace("text/", "").Replace("application/", "").Replace("audio/", "").Replace("music/", "").Replace("application/", "");
                    lblSize.Text = getTamanho(fileInfo.Length);
                }
            }
        }


        private static String getTamanho(double VlByte)
        {
            string rtl = "0.00 byte";
            if (VlByte >= 1024)
            {
                VlByte = VlByte / 1024;
                if (VlByte >= 1024)
                {
                    VlByte = VlByte / 1024;
                    if (VlByte >= 1024)
                    {
                        VlByte = VlByte / 1024;
                        if (VlByte >= 1024)
                        {
                            VlByte = VlByte / 1024;
                        }
                        else
                            rtl = string.Format("{0:N2} {1}", VlByte, "GB");
                    }
                    else
                        rtl = string.Format("{0:N2} {1}", VlByte, "MB");
                }
                else
                    rtl = string.Format("{0:N2} {1}", VlByte, "KB");
            }
            else
                rtl = string.Format("{0:N2} {1}", VlByte, "Byte"); ;


            return "(" + rtl + ")";
        }

        /// <summary>
        /// 
        /// </summary> 
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void ItemCommand(object sender, ListViewCommandEventArgs args)
        {
            // handle either opening the item or rebinding the grid
            if (args.CommandName == "OpenFile")
            {
                //  they clicked on a file, download it
                string name = (string)args.CommandArgument;
                string fullFilePath = System.IO.Path.Combine(this.BuildFullFilePath(this.CurrentNodeValuePath), name);

                System.IO.FileInfo fileInfo = new System.IO.FileInfo(fullFilePath);

                this.Response.Clear();
                this.Response.AddHeader("Content-Disposition", "attachment; filename=" + fileInfo.Name);
                this.Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                this.Response.ContentType = "application/octet-stream";
                this.Response.WriteFile(fileInfo.FullName);
                this.Response.End();
            }
            else if (args.CommandName == "OpenFolder")
            {
                string name = (string)args.CommandArgument;

                TreeNode node = this.tvFolders.FindNode(string.Format("{0}{1}{2}", this.CurrentNodeValuePath, this.tvFolders.PathSeparator, name));
                node.Selected = true;
                this.CurrentNodeValuePath = node.ValuePath;

                // expand the parents
                TreeNode parentNode = node.Parent;
                while (parentNode != null)
                {
                    parentNode.Expanded = true;
                    parentNode = parentNode.Parent;
                }

                // bind the gridview to the datasource
                this.BindDirsContents(node);
            }
            else if (args.CommandName == "DeleteFile")
            {
                string name = (string)args.CommandArgument;
                string fullFilePath = System.IO.Path.Combine(this.BuildFullFilePath(this.CurrentNodeValuePath), name);

                System.IO.FileInfo fileInfo = new System.IO.FileInfo(fullFilePath);
                fileInfo.Delete();
                BindDirsContents(this.CurrentNodeValuePath);

            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void TvFolders_SelectedNodeChanged(object sender, EventArgs args)
        {
            //  keep track of the selected folder
            this.CurrentNodeValuePath = this.tvFolders.SelectedNode.ValuePath;
            //  rebind the grid with the selected folders contents
            this.BindDirsContents(this.tvFolders.SelectedNode);

            //  bind the details view with the fodlers details
            this.dvFolderDetails.DataSource =
                new object[]
            { 
                new System.IO.DirectoryInfo(this.BuildFullFilePath(this.tvFolders.SelectedNode.ValuePath)) 
            };
            this.dvFolderDetails.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="node"></param>
        private void BindDirsContents(TreeNode node)
        {
            // bind the gridview to the datasource
            this.lvItems.DataSource = new System.IO.DirectoryInfo(this.BuildFullFilePath(node.ValuePath)).GetFileSystemInfos();
            this.lvItems.DataBind();
        }

        private void BindDirsContents(string path)
        {
            // bind the gridview to the datasource
            this.lvItems.DataSource = new System.IO.DirectoryInfo(this.BuildFullFilePath(path)).GetFileSystemInfos();
            this.lvItems.DataBind();
        }

        /// <summary>
        /// Converts a nodes ValuePath into the full file/folder path
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private string BuildFullFilePath(string valuePath)
        {
            string rootPath = this.fileSystemDataSource.IncludeRoot
                ? HttpContext.Current.Server.MapPath(this.Request.ApplicationPath)
                : HttpContext.Current.Server.MapPath(System.IO.Path.Combine(this.Request.ApplicationPath, this.fileSystemDataSource.RootPath));
            return System.IO.Path.Combine(rootPath, valuePath);
        }

        protected void ToolkitScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
        {
            ToolkitScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
        }
    }
}
