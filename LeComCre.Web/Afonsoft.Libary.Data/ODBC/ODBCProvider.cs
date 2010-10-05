using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using System.Data.Odbc;
using System.Data;
using System.Xml;
using System.IO;

namespace Afonsoft.Libary.Data.Provider.ODBC
{
    class ODBCProvider : Provider
    {
        
        public override string Identificador
        {
            get
            {
                return "ODBC";
            }
        }
        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.ODBC.ODBCProvider"; }
        }
        public override string Assembly
        {
            get { return "Afonsoft.Libary.Data"; }
        }

        public override IDbConnection CreateConnection()
        {
            return new OdbcConnection(StringConexao);
        }

        public override IDbConnection getConnection
        {
            get 
            {
                if (_cnn == null)
                    _cnn = CreateConnection();
                return _cnn;
            }
        }

        public override IDbDataAdapter getDataAdapter()
        {
            return new OdbcDataAdapter();
        }

        public override void ConfigureConnection(IDbConnection connection)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool TestConnection()
        {
            IDbConnection connection = CreateConnection();
            connection.Open();
            connection.Close();
            connection.Dispose();
            return true;
        }

        public override IDbCommand getCommand()
        {
            return new OdbcCommand();
        }
    }
}
