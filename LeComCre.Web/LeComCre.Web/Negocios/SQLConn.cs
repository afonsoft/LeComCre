using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Afonsoft.Libary.Cryptographic;
using Afonsoft.Libary.Connection;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web.Negocios
{
    public static class SQLConn
    {
        private static dbConnection Conn = new dbConnection();

        public static void ExecuteNoQuery(String Query)
        {
            try
            {
                Conn.OpenConnection();
                Conn.ExecuteNoQuery(Query);
            }
            finally { Conn.CloseConnection(); }
        }

        public static DataSet ExecuteQuery(String Query)
        {
            try
            {
                Conn.OpenConnection();
                return Conn.ExecuteQuery(Query);
            }
            finally { Conn.CloseConnection(); }
        }

        public static object ExecuteScalar(String Query)
        {
            try
            {
                Conn.OpenConnection();
                return Conn.ExecuteScalar(Query);
            }
            finally { Conn.CloseConnection(); }
        }

        public static IDataReader ExecuteReader(String Query)
        {
            try
            {
                Conn.OpenConnection();
                return Conn.ExecuteReader(Query);
            }
            finally { Conn.CloseConnection(); }
        }
    }
}
