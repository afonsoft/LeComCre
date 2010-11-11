using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Data.OracleClient;
using System.Data.Sql;
using System.Data.SQLite;
using MySql.Data.MySqlClient;

namespace Afonsoft.Libary.Data.Provider
{
    public abstract class Provider : IProvider
    {

        string conexao;
        IDbTransaction _trans = null;
        public IDbConnection _cnn = null;

        public Provider()
        {

        }

        public abstract IDbConnection CreateConnection();

        public abstract IDbConnection getConnection { get; }

        public abstract IDbDataAdapter getDataAdapter();

        public abstract void ConfigureConnection( IDbConnection connection );

        public abstract bool TestConnection();

        public abstract System.Data.IDbCommand getCommand();

        #region AttachParameters
        public virtual void AttachParameters( IDbCommand command, IDbDataParameter[] Parameters )
        {
            foreach ( IDbDataParameter idbParameter in Parameters )
            {
                if ( ( idbParameter.Direction == ParameterDirection.InputOutput ) && ( idbParameter.Value == null ) )
                    idbParameter.Value = DBNull.Value;
                command.Parameters.Add( idbParameter );
            }
        }
        #endregion

        #region Conexão

        public virtual bool isOpen
        {
            get
            {
                return _cnn.State == ConnectionState.Open;
            }
        }
        public virtual bool isClose
        {
            get
            {
                return _cnn.State == ConnectionState.Closed;
            }
        }

        public virtual ConnectionState State
        {
            get
            {
                return _cnn.State;
            }
        }

        public virtual bool OpenConnection()
        {
            try
            {
                if ( _cnn == null || _cnn.ConnectionString == "" )
                {
                    _cnn = null;
                    _cnn = getConnection;
                }
                if ( _cnn.State == ConnectionState.Closed )
                    _cnn.Open();
                return true;
            } catch ( Exception ) { return false; }
        }

        public virtual bool CloseConnection()
        {
            try
            {
                if ( _cnn != null )
                    if ( _cnn.State != ConnectionState.Closed )
                        _cnn.Close();
                return true;
            } catch ( Exception ) { return false; }
        }

        public virtual bool ChangeDataBase( String db )
        {
            try
            {
                if ( _cnn != null )
                    _cnn.ChangeDatabase( db );
                return true;
            } catch ( Exception ) { return false; }
        }
        #endregion

        #region Metodos virtuais

        public virtual string Identificador
        {
            get { throw new NotImplementedException( "Identificador" ); }
        }

        public virtual string TypeName
        {
            get { throw new NotImplementedException( "TypeName" ); }
        }

        public virtual string Assembly
        {
            get { throw new NotImplementedException( "Assembly" ); }
        }

        public virtual string StringConexao
        {
            get { return conexao; }
            set { conexao = value; }
        }

        public virtual string DatabaseName
        {
            get
            {
                System.Data.IDbConnection connection = CreateConnection();
                return connection.Database;
            }
        }

        #endregion

        #region Transaction

        public virtual bool ExistTransaction
        {
            get
            {
                if ( Transaction != null )
                    return true;
                else
                    return false;
            }
        }

        public IDbTransaction Transaction
        {
            get
            {
                return _trans;
            }
            set
            {
                _trans = value;
            }
        }

        public bool BeginTransaction( IsolationLevel isolation )
        {
            try
            {
                _cnn = getConnection;
                Transaction = _cnn.BeginTransaction( isolation );
                return true;
            } catch ( Exception ) { return false; }
        }

        public bool CommitTransaction()
        {
            try
            {
                if ( Transaction != null )
                {
                    Transaction.Commit();
                    Transaction = null;
                    return true;
                } else
                    return false;

            } catch ( Exception ) { return false; }
        }

        public bool RollbackTransaction()
        {
            try
            {
                if ( Transaction != null )
                {
                    Transaction.Rollback();
                    Transaction = null;
                    return true;
                } else
                    return false;

            } catch ( Exception ) { return false; }
        }

        #endregion

        #region ExecuteQuery, ExecuteReader, ExecuteNoQuery, ExecutarScalar


        public virtual DataSet ExecuteQuery( string Query )
        {
            return ExecuteQuery( Query, CommandType.Text, null );
        }

        public virtual DataSet ExecuteQuery( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            try
            {
                using ( IDbCommand cd = getConnection.CreateCommand() )
                {
                    cd.CommandText = Query;
                    cd.CommandType = commandType;
                    //Adicionar a Transação
                    if ( Transaction != null )
                        cd.Transaction = Transaction;
                    //Adicionar os paramentros
                    if ( param != null )
                        AttachParameters( cd, param );
                    IDbDataAdapter da = getDataAdapter();
                    da.SelectCommand = cd;
                    DataSet ds = new DataSet();
                    isCloseOpenConnection();
                    da.Fill( ds );
                    return ds;
                }
            } catch ( Exception ex ) { RollbackTransaction(); throw ex; } finally { isNoTransCloseConnection(); }
        }

        public virtual IDataReader ExecuteReader( string Query )
        {
            return ExecuteReader( Query, CommandType.Text, null );
        }

        public virtual IDataReader ExecuteReader( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            try
            {
                using ( IDbCommand cd = getConnection.CreateCommand() )
                {
                    cd.CommandText = Query;
                    cd.CommandType = commandType;
                    //Adicionar a Transação
                    if ( Transaction != null )
                        cd.Transaction = Transaction;
                    //Adicionar os paramentros
                    if ( param != null )
                        AttachParameters( cd, param );
                    isCloseOpenConnection();
                    return cd.ExecuteReader( CommandBehavior.Default );
                }
            } catch ( Exception ex ) { RollbackTransaction(); CloseConnection(); throw ex; } finally { isNoTransCloseConnection(); }
        }

        public virtual void ExecuteNoQuery( string Query )
        {
            ExecuteNoQuery( Query, CommandType.Text, null );
        }

        public virtual void ExecuteNoQuery( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            try
            {
                using ( IDbCommand cd = getConnection.CreateCommand() )
                {
                    cd.CommandText = Query;
                    cd.CommandType = commandType;
                    //Adicionar a Transação
                    if ( Transaction != null )
                        cd.Transaction = Transaction;
                    //Adicionar os paramentros
                    if ( param != null )
                        AttachParameters( cd, param );
                    isCloseOpenConnection();
                    cd.ExecuteNonQuery();

                }
            } catch ( Exception ex ) { RollbackTransaction(); CloseConnection(); throw ex; } finally { isNoTransCloseConnection(); }
        }

        public virtual object ExecuteScalar( string Query )
        {
            return ExecuteScalar( Query, CommandType.Text, null );
        }

        public virtual object ExecuteScalar( string Query, CommandType commandType, IDbDataParameter[] param )
        {
            try
            {
                using ( IDbCommand cd = getConnection.CreateCommand() )
                {
                    cd.CommandText = Query;
                    cd.CommandType = commandType;
                    //Adicionar a Transação
                    if ( Transaction != null )
                        cd.Transaction = Transaction;
                    //Adicionar os paramentros
                    if ( param != null )
                        AttachParameters( cd, param );
                    isCloseOpenConnection();
                    return cd.ExecuteScalar();
                }
            } catch ( Exception ex ) { RollbackTransaction(); CloseConnection(); throw ex; } finally { isNoTransCloseConnection(); }
        }

        #endregion

        #region Validação para Abrir e Fechar a Conexao
        private void isCloseOpenConnection()
        {
            if ( isClose )
                OpenConnection();
        }

        private void isNoTransCloseConnection()
        {
            if ( Transaction == null )
                CloseConnection();
        }
        #endregion

    }
}
