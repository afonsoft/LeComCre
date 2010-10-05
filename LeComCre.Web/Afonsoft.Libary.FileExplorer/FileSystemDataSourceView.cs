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
    public class FileSystemDataSourceView : HierarchicalDataSourceView
    {
        /// <summary>
        /// 
        /// </summary>
        private string _viewPath;
        /// <summary>
        /// 
        /// </summary>
        private FileSystemDataSource _fileSystemDataSource;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="viewPath"></param>
        public FileSystemDataSourceView(FileSystemDataSource fileSystemDataSource, string viewPath)
            : base()
        {
            this._viewPath = viewPath;
            this._fileSystemDataSource = fileSystemDataSource;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public override IHierarchicalEnumerable Select()
        {
            // SECURITY: There are many security issues that can be raised
            // SECURITY: by exposing the file system structure of a Web server
            // SECURITY: to an anonymous user in a limited trust scenario such as
            // SECURITY: a Web page served on an intranet or the Internet.

            // resolve the path
            string path;
            if (Path.IsPathRooted(this._fileSystemDataSource.RootPath))
            {
                path = Path.Combine(this._fileSystemDataSource.RootPath, this._viewPath);
            }
            else
            {
                path = Path.Combine(HttpContext.Current.Server.MapPath(Path.Combine(HttpContext.Current.Request.ApplicationPath, this._fileSystemDataSource.RootPath)), this._viewPath);
            }

            //  get the directory object
            DirectoryInfo rootDirectory = new DirectoryInfo(path);

            //  enumerate the FileSystemInfo objects and add them to the collection
            FileSystemHierarchicalEnumerable fshe = new FileSystemHierarchicalEnumerable();

            if (this._fileSystemDataSource.IncludeRoot)
            {
                fshe.Add(new FileSystemHierarchyData(rootDirectory, this._viewPath, this._fileSystemDataSource.FoldersOnly));
            }
            else
            {
                IEnumerable fileSystemInfos = this._fileSystemDataSource.FoldersOnly ? rootDirectory.GetDirectories() : rootDirectory.GetFileSystemInfos();
                foreach (FileSystemInfo fsi in fileSystemInfos)
                {
                    fshe.Add(new FileSystemHierarchyData(fsi, this._viewPath, this._fileSystemDataSource.FoldersOnly));
                }
            }

            return fshe;
        }
    }
}
