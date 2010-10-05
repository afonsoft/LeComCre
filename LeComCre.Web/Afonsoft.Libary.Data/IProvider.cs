using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.IO;
using System.Xml;

namespace Afonsoft.Libary.Data.Provider
{
    public interface IProvider
    {
        //Variaveis
        string Identificador { get; }
        string StringConexao { set; get; }
        void ConfigureConnection(IDbConnection connection);
        string Assembly { get; }
        string TypeName { get; }
        bool TestConnection();

        //Controle de transações
        IDbTransaction Transaction { get; set; }
        bool BeginTransaction(IsolationLevel isolation);
        bool CommitTransaction();
        bool RollbackTransaction();
        
        //Objetos de conexões
        IDbConnection CreateConnection();
        IDbDataAdapter getDataAdapter();
        bool ExistTransaction { get; }
        bool OpenConnection();
        bool CloseConnection();
        bool ChangeDataBase(String db);
        bool isOpen { get; }
        bool isClose { get; }
        ConnectionState State { get; }
        IDbCommand getCommand();

        //Metodos para execução
        IDataReader ExecuteReader(String Query);
        IDataReader ExecuteReader(String Query, CommandType commandType, IDbDataParameter[] param);
        DataSet ExecuteQuery(String Query);
        DataSet ExecuteQuery(String Query, CommandType commandType, IDbDataParameter[] param);
        void ExecuteNoQuery(String Query);
        void ExecuteNoQuery(String Query, CommandType commandType, IDbDataParameter[] param);
        object ExecuteScalar(String Query);
        object ExecuteScalar(String Query, CommandType commandType, IDbDataParameter[] param);


    }
}
