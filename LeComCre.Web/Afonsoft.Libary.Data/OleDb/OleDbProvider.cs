
using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using System.Data.OleDb;
using System.Data;
using System.Xml;
using System.IO;

namespace Afonsoft.Libary.Data.Provider.OleDb
{
    public class OleDbProvider : Provider
    {
        /// <summary>
        /// msaccess://localhost/C:\\SampleDB.mdb
        /// Microsoft.Jet.OLEDB.4.0://localhost/C:\\SampleDB.mdb
        /// </summary>
        /// <param name="databaseSchema"></param>
        public OleDbProvider()
            : base()
        {

        }

        public override string Identificador
        {
            get
            {
                return "OleDb";
            }
        }

        public override System.Data.IDbConnection CreateConnection()
        {
            return new OleDbConnection( StringConexao );
        }

        public override void ConfigureConnection( System.Data.IDbConnection connection )
        {
            //throw new Exception("The method or operation is not implemented.");
        }

        public override bool TestConnection()
        {
            System.Data.IDbConnection connection = CreateConnection();
            connection.Open();
            connection.Close();
            connection.Dispose();
            return true;
        }

        public override System.Data.IDbDataAdapter getDataAdapter()
        {
            return new OleDbDataAdapter();
        }

        public override System.Data.IDbCommand getCommand()
        {
            return new OleDbCommand();
        }

        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.OleDb.OleDbProvider"; }
        }
        public override string Assembly
        {
            get { return "Afonsoft.Libary.Data"; }
        }

        public override IDbConnection getConnection
        {
            get
            {
                if ( _cnn == null )
                    _cnn = CreateConnection();
                return _cnn;
            }
        }
    }
}
