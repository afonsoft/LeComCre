using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Reflection;
using System.Collections;
using Afonsoft.Libary.Data.Provider;

namespace Afonsoft.Libary.Data.Provider
{
    public sealed class ProviderFactory
    {
        private static Dictionary<string, IProvider> factories;
        static ProviderFactory()
        {
            factories = new Dictionary<string, IProvider>();
            Assembly assembly = null;
            IProvider fac = null;

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.OleDb.OleDbProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.Oracle.OracleProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.MySQL.MySQLProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.MSSQL.MSSQLProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.ODBC.ODBCProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

            assembly = Assembly.Load( "Afonsoft.Libary.Data" );
            fac = assembly.CreateInstance( "Afonsoft.Libary.Data.Provider.SQLite.SQLiteProvider" ) as IProvider;
            factories.Add( fac.Identificador, fac );

        }
        public static IEnumerable<IProvider> Providers
        {
            get { return factories.Values; }
        }

        public static IProvider GetProvider( string id )
        {
            if ( id == null )
                throw new ArgumentNullException( "id" );

            IProvider fac = null;
            if ( factories.TryGetValue( id, out fac ) )
                return fac;
            return null;
        }

        public static IProvider CreateProvider( string ConectionString, string idProvider )
        {
            try
            {
                IProvider provider = GetProvider( idProvider );
                if ( provider !=null )
                    provider.StringConexao = ConectionString;

                return provider;
            } catch ( Exception ex )
            {
                throw ex;
            }
        }

    }
}
