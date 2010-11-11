
using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using System.Data.SQLite;
using System.Data;
using System.Xml;
using System.IO;

namespace Afonsoft.Libary.Data.Provider.SQLite
{
    public class SQLiteProvider : Provider
    {

        public SQLiteProvider()
            : base()
        {
        }

        public override string Identificador
        {
            get
            {
                return "SQLite";
            }
        }

        public override System.Data.IDbConnection CreateConnection()
        {
            return new SQLiteConnection( StringConexao );
        }

        public override void ConfigureConnection( System.Data.IDbConnection connection )
        {
            throw new Exception( "The method or operation is not implemented." );
        }

        public override bool TestConnection()
        {
            System.Data.IDbConnection connection = CreateConnection();
            connection.Open();
            connection.Close();
            connection.Dispose();
            return true;
        }

        public override IDbCommand getCommand()
        {
            return new SQLiteCommand();
        }

        public override IDbDataAdapter getDataAdapter()
        {
            return new SQLiteDataAdapter();
        }

        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.MSSQL.SQLiteProvider"; }
        }
        public override string Assembly
        {
            get { return "Afonsoft.Libary.Data"; }
        }

        public override IDbConnection getConnection
        {
            get
            {
                if ( _cnn == null || _cnn.ConnectionString == "" )
                {
                    _cnn = null;
                    _cnn = CreateConnection();
                }
                return _cnn;
            }
        }
    }
}
