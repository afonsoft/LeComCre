using System;
using System.Collections;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Afonsoft.Libary.Web.FileExplorer
{
    /// <summary>
    /// 
    /// </summary>
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    public class FileSystemDataSource : HierarchicalDataSourceControl, IHierarchicalDataSource
    {
        /// <summary>
        /// 
        /// </summary>
        private string _rootPath;
        /// <summary>
        /// 
        /// </summary>
        private bool _foldersOnly;
        /// <summary>
        /// 
        /// </summary>
        private bool _includeRoot;

        /// <summary>
        /// 
        /// </summary>
        public FileSystemDataSource() : base() { }

        /// <summary>
        /// 
        /// </summary>
        public string RootPath
        {
            get { return this._rootPath; }
            set { this._rootPath = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public bool FoldersOnly
        {
            get { return this._foldersOnly; }
            set { this._foldersOnly = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public bool IncludeRoot
        {
            get { return this._includeRoot; }
            set { this._includeRoot = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="viewPath"></param>
        /// <returns></returns>
        protected override HierarchicalDataSourceView GetHierarchicalView(string viewPath)
        {
            return new FileSystemDataSourceView(this, viewPath);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected override ControlCollection CreateControlCollection()
        {
            return new ControlCollection(this);
        }
    }
}
