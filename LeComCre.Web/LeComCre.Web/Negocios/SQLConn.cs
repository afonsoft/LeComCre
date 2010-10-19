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


        public static bool BeginTransaction()
        {
            return Conn.BeginTransaction(IsolationLevel.ReadCommitted);
        }
        public static bool CommitTransaction()
        {
            return Conn.CommitTransaction();
        }
        public static bool RollbackTransaction()
        {
            return Conn.RollbackTransaction();
        }

        public static void ExecuteNoQuery(String Query)
        {
            Conn.OpenConnection();
            Conn.ExecuteNoQuery(Query);
        }

        public static DataSet ExecuteQuery(String Query)
        {
            Conn.OpenConnection();
            return Conn.ExecuteQuery(Query);
        }

        public static object ExecuteScalar(String Query)
        {
            Conn.OpenConnection();
            return Conn.ExecuteScalar(Query);
        }

        public static IDataReader ExecuteReader(String Query)
        {
            Conn.OpenConnection();
            return Conn.ExecuteReader(Query);
        }
    }
}
