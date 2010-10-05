using System;
using System.Collections.Generic;
using System.Text;
using Afonsoft.Libary.Data.Provider;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.IO;


namespace Afonsoft.Libary.Data.Provider.MySQL
{
    public class MySQLProvider : Provider
    {
        public MySQLProvider()
            : base()
        {

        }

        public override string Identificador
        {
            get
            {
                return "MySQL";
            }
        }

        public override System.Data.IDbConnection CreateConnection()
        {
            return new MySqlConnection(StringConexao);
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
            return new MySqlCommand();
        }

        public override IDbDataAdapter getDataAdapter()
        {
            return new MySqlDataAdapter();
        }

        public override string TypeName
        {
            get { return "Afonsoft.Libary.Data.Provider.MySQL.MySQLProvider"; }
        }
        public override string Assembly
        {
            get { return "Afonsoft.Libary.Data"; }
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
    }
}
