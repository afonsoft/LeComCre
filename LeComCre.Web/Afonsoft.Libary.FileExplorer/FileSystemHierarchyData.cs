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
    public class FileSystemHierarchyData : IHierarchyData
    {
        /// <summary>
        /// 
        /// </summary>
        private FileSystemInfo _fileSystemObject;
        /// <summary>
        /// 
        /// </summary>
        private string _path;
        /// <summary>
        /// 
        /// </summary>
        private bool _foldersOnly;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        public FileSystemHierarchyData(FileSystemInfo obj, string parentPath, bool foldersOnly)
        {
            this._fileSystemObject = obj;
            this._path = System.IO.Path.Combine(parentPath, obj.Name);
            this._foldersOnly = foldersOnly;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this._fileSystemObject.Name;
        }

        /// <summary>
        /// 
        /// </summary>
        public bool HasChildren
        {
            get
            {
                bool hasChildren = false;

                if (this._fileSystemObject is DirectoryInfo)
                {
                    if (this.FoldersOnly)
                    {
                        hasChildren = ((DirectoryInfo)this._fileSystemObject).GetDirectories().Length > 0;
                    }
                    else
                    {
                        hasChildren = ((DirectoryInfo)this._fileSystemObject).GetFileSystemInfos().Length > 0;
                    }
                }

                return hasChildren;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Path
        {
            get { return this._path; }
        }

        /// <summary>
        /// 
        /// </summary>
        protected bool FoldersOnly
        {
            get { return this._foldersOnly; }
        }

        /// <summary>
        /// 
        /// </summary>
        public object Item
        {
            get { return this._fileSystemObject; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Type
        {
            get { return "FileSystemData"; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IHierarchicalEnumerable GetChildren()
        {
            FileSystemHierarchicalEnumerable children = new FileSystemHierarchicalEnumerable();

            if (this._fileSystemObject is DirectoryInfo)
            {
                foreach (FileSystemInfo fsi in ((DirectoryInfo)this._fileSystemObject).GetFileSystemInfos())
                {
                    if (fsi is DirectoryInfo && this.FoldersOnly || fsi is FileInfo && !this.FoldersOnly)
                    {
                        children.Add(new FileSystemHierarchyData(fsi, this.Path, this.FoldersOnly));
                    }
                }
            }

            return children;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IHierarchyData GetParent()
        {
            FileSystemHierarchicalEnumerable parentContainer = new FileSystemHierarchicalEnumerable();

            IHierarchyData parent = null;

            if (this._fileSystemObject is DirectoryInfo)
            {
                parent = new FileSystemHierarchyData(((DirectoryInfo)this._fileSystemObject).Parent, this.Path, this.FoldersOnly);
            }
            else if (this._fileSystemObject is FileInfo)
            {
                parent = new FileSystemHierarchyData(((FileInfo)this._fileSystemObject).Directory, this.Path, this.FoldersOnly);
            }

            return parent;
        }
    }
}
