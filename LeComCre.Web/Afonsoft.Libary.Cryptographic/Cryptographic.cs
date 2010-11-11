using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace Afonsoft.Libary.Cryptographic
{
    public static class Encryption
    {
        private static byte[] chave = { };
        private static byte[] iv = { 12, 34, 56, 78, 90, 102, 114, 126 };

        /// <summary>
        /// Criptografar uma string
        /// </summary>
        /// <param name="texto">String a ser criptografar</param>
        /// <returns>String Criptografar</returns>
        public static String Criptografar( String texto )
        {
            return Criptografar( texto, "AbCdEfGh" );
        }
        /// <summary>
        /// Criptografar uma string
        /// </summary>
        /// <param name="texto">String a ser criptografar</param>
        /// <param name="chaveCriptografia">Chave usada para criptografar Min/Max 8 caracter</param>
        /// <returns>String Criptografar</returns>
        public static String Criptografar( String texto, String chaveCriptografia )
        {
            DESCryptoServiceProvider des;
            MemoryStream ms;
            CryptoStream cs;
            byte[] input;

            if ( String.IsNullOrEmpty( texto ) )
                throw new ArgumentNullException( "texto", "Não existe uma string para Criptografar." );

            if ( String.IsNullOrEmpty( chaveCriptografia ) )
                chaveCriptografia = "AbCdEfGh";

            if ( chaveCriptografia.Length < 8 )
                throw new ArgumentException( "chaveCriptografia", "A chave teve conter no minimo 8 caracteres" );

            try
            {
                des = new DESCryptoServiceProvider();
                ms = new MemoryStream();

                input = Encoding.UTF8.GetBytes( texto );
                chave = Encoding.UTF8.GetBytes( chaveCriptografia.Substring( 0, 8 ) );
                cs = new CryptoStream( ms, des.CreateEncryptor( chave, iv ), CryptoStreamMode.Write );
                cs.Write( input, 0, input.Length );
                cs.FlushFinalBlock();
                return HexEncoding.ToString( ms.ToArray() );

            } catch ( Exception ex )
            {
                throw new Exception( "Metodo: Criptografar - (Cryptographic.cs)", ex );
            }
        }
        /// <summary>
        /// Descriptografar uma string
        /// </summary>
        /// <param name="texto">String Criptografar</param>
        /// <returns>String desriptografar</returns>
        public static String Descriptografar( String texto )
        {
            return Descriptografar( texto, "AbCdEfGh" );
        }
        /// <summary>
        /// Descriptografar uma string
        /// </summary>
        /// <param name="texto">String Criptografar</param>
        /// <param name="chaveCriptografia">Chave usada para Descriptografar Min/Max 8 caracter</param>
        /// <returns>String desriptografar</returns>
        public static String Descriptografar( String texto, String chaveCriptografia )
        {
            DESCryptoServiceProvider des;
            MemoryStream ms;
            CryptoStream cs;
            byte[] input;

            if ( String.IsNullOrEmpty( texto ) )
                throw new ArgumentException( "texto", "Não existe uma string para descriptografar." );

            if ( String.IsNullOrEmpty( chaveCriptografia ) )
                chaveCriptografia = "AbCdEfGh";

            if ( chaveCriptografia.Length < 8 )
                throw new ArgumentException( "chaveCriptografia", "A chave teve conter no minimo 8 caracteres" );

            try
            {
                des = new DESCryptoServiceProvider();
                ms = new MemoryStream();

                int discarded;
                input = HexEncoding.GetBytes( texto, out discarded );

                chave = Encoding.UTF8.GetBytes( chaveCriptografia.Substring( 0, 8 ) );

                cs = new CryptoStream( ms, des.CreateDecryptor( chave, iv ), CryptoStreamMode.Write );
                cs.Write( input, 0, input.Length );
                cs.FlushFinalBlock();

                return Encoding.UTF8.GetString( ms.ToArray() );
            } catch ( Exception ex )
            {
                throw new Exception( "Metodo: Descriptografar - (Cryptographic.cs)", ex );
            }

        }

    }
}
