using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Configuration;
using Afonsoft.Libary;
using System.Xml;
using System.IO;
using System.Reflection;
using Afonsoft.Libary.Data.Provider;

namespace Afonsoft.Libary.Connection
{

    public class dbConnection : IDisposable
    {
        private IProvider provider = null;
        private static String strConexao = "";
        private static String strTypeProvider = "";

        public enum TypeConexao { MSSQL2005, MySQL, ODBC, OleDb, Oracle, SQLite }

        #region Construdor

        /// <summary>
        /// Metodo para criar a instancia da conexão
        /// </summary>
        /// <param name="StringConexao">String da Conexão</param>
        /// <param name="TypeProvider">Tipo de Provider</param>
        public dbConnection( String StringConexao, TypeConexao TypeProvider )
        {
            try
            {
                strConexao = StringConexao;
                strTypeProvider = TypeProvider.ToString();
                provider = ProviderFactory.CreateProvider( strConexao, strTypeProvider );
                provider.TestConnection();
            } catch ( Exception ex )
            {
                throw new Exception( "CreateProvider: " + ex.Message, ex );
            }

        }

        /// <summary>
        /// Metodo para criar a instacia da classe de coneção, recuperando os valores do app.config ou web.config da section appSettings
        /// Ex. Conexão <add key="Conexao" value="" />
        /// Ex. Tipo <add key="Provider" value="MySQL"/>
        /// </summary>
        public dbConnection()
        {
            try
            {
                try
                {
                    strConexao = ConfigurationSettings.AppSettings[ "Conexao" ];
                } catch ( Exception ex ) { throw new Exception( "Erro para recuperar as configurações Key=`Conexao`: " + ex.Message, ex ); }
                try
                {
                    strTypeProvider = ConfigurationSettings.AppSettings[ "Provider" ];
                } catch ( Exception ex ) { throw new Exception( "Erro para recuperar as configurações Key=`Provider`: " + ex.Message, ex ); }

                provider = ProviderFactory.CreateProvider( strConexao, strTypeProvider );
                provider.TestConnection();
            } catch ( Exception ex )
            {
                throw new Exception( "CreateProvider: " + ex.Message, ex );
            }
        }

        #endregion

        #region Open, Close e ChangeDataBase

        public bool isOpen
        {
            get
            {
                return provider.isOpen;
            }
        }

        public bool isClose
        {
            get
            {
                return provider.isClose;
            }
        }

        public ConnectionState State
        {
            get
            {
                return provider.State;
            }
        }

        public bool OpenConnection()
        {
            return provider.OpenConnection();
        }

        public bool CloseConnection()
        {
            return provider.CloseConnection();
        }

        public bool ChangeDataBase( String db )
        {
            return provider.ChangeDataBase( db );
        }
        #endregion

        #region Transaction
        public bool ExistTransaction
        {
            get
            {
                return provider.ExistTransaction;
            }
        }
        public bool BeginTransaction( IsolationLevel isolation )
        {
            return provider.BeginTransaction( isolation );
        }
        public bool CommitTransaction()
        {
            return provider.CommitTransaction();
        }
        public bool RollbackTransaction()
        {
            return provider.RollbackTransaction();
        }
        #endregion

        #region Executes
        public DataSet ExecuteQuery( string Query )
        {
            return provider.ExecuteQuery( Query );
        }
        public DataSet ExecuteQuery( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            return provider.ExecuteQuery( Query, commandType, param );
        }
        public IDataReader ExecuteReader( string Query )
        {
            return provider.ExecuteReader( Query );
        }
        public IDataReader ExecuteReader( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            return provider.ExecuteReader( Query, commandType, param );
        }
        public void ExecuteNoQuery( string Query )
        {
            provider.ExecuteNoQuery( Query );
        }
        public void ExecuteNoQuery( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            provider.ExecuteNoQuery( Query, commandType, param );
        }
        public object ExecuteScalar( string Query )
        {
            return provider.ExecuteScalar( Query );
        }
        public object ExecuteScalar( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            return provider.ExecuteScalar( Query, commandType, param );
        }
        #endregion

        #region Dispose
        #region IDisposable Members

        public void Dispose()
        {
            CommitTransaction();
            CloseConnection();
            provider = null;
            GC.SuppressFinalize( this );
        }

        #endregion

        #region IDisposable Members

        void IDisposable.Dispose()
        {
            CommitTransaction();
            CloseConnection();
            provider = null;
            GC.SuppressFinalize( this );
        }

        #endregion
        #endregion
    }

}