
using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using System.Data.SqlClient;
using System.Data;
using System.Xml;
using System.IO;

namespace Afonsoft.Libary.Data.Provider.MSSQL
{
    public class MSSQLProvider: Provider
    {
       
        public MSSQLProvider()
            : base()
        {
        }

        public override string Identificador
        {
            get
            {
                return "MSSQL2005";
            }
        }

        public override System.Data.IDbConnection CreateConnection()
        {
            return new SqlConnection(StringConexao);
        }

        public override void ConfigureConnection(System.Data.IDbConnection connection)
        {
            throw new Exception("The method or operation is not implemented.");
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
            return new SqlCommand();
        }

        public override IDbDataAdapter getDataAdapter()
        {
            return new SqlDataAdapter();
        }

        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.MSSQL.MSSQLProvider"; }
        }
        public override string Assembly
        {
            get { return "Afonsoft.Libary.Data"; }
        }

        public override IDbConnection getConnection
        {
            get
            {
                if (_cnn == null || _cnn.ConnectionString == "")
                {
                    _cnn = null;
                    _cnn = CreateConnection();
                }
                return _cnn;
            }
        }
    }
}
