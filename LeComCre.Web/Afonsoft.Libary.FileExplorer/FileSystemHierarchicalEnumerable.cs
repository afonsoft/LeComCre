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
    public class FileSystemHierarchicalEnumerable : ArrayList, IHierarchicalEnumerable
    {
        /// <summary>
        /// 
        /// </summary>
        public FileSystemHierarchicalEnumerable() : base() {}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="enumeratedItem"></param>
        /// <returns></returns>
        public IHierarchyData GetHierarchyData(object enumeratedItem)
        {
            return enumeratedItem as IHierarchyData;
        }
    }
}
