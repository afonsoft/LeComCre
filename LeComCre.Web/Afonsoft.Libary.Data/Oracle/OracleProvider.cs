using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using System.Data.OracleClient;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Xml;

namespace Afonsoft.Libary.Data.Provider.Oracle
{
    public class OracleProvider : Provider
    {
        public OracleProvider()
            : base()
        {

        }
        public override string Identificador
        {
            get
            {
                return "Oracle";
            }
        }

        public override System.Data.IDbConnection CreateConnection()
        {
            return new OracleConnection( StringConexao );
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
            return new OracleCommand();
        }

        public override IDbDataAdapter getDataAdapter()
        {
            return new OracleDataAdapter();
        }

        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.Oracle.OracleProvider"; }
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
