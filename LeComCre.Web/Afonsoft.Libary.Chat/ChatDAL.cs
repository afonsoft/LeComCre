using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Net;
using System.Net.NetworkInformation;
using Afonsoft.Libary.Connection;
using Afonsoft.Libary.Utilities;
using System.Data;

namespace Afonsoft.Libary.Chat
{
    public static class ChatDAL
    {
        private static Cache WebCache { get { return HttpContext.Current == null ? null : HttpContext.Current.Cache; } }
        private static dbConnection Conn = null;
        static ChatDAL()
        {
            Conn = new dbConnection();
        }

        #region Save and Get Session Cache
        private static void SaveSessionList( List<Usuario> sessionList )
        {
            try
            {
                WebCache.Insert( "UserChat", sessionList );
            } catch ( Exception ex )
            {
                throw new Exception( "Erro para gravar o Cache", ex );
            }

        }

        private static List<Usuario> GetSessionList()
        {
            try
            {
                if ( WebCache == null || WebCache[ "UserChat" ] == null )
                {
                    WebCache.Insert( "UserChat", new List<Usuario>() );
                }
            } catch ( Exception ex )
            {
                throw new Exception( "Erro para gravar o Cache", ex );
            }

            return WebCache[ "UserChat" ] as List<Usuario>;
        }

        #endregion

        public static void RemoveUserChatSession( Usuario user )
        {
            try
            {
                List<Usuario> sessionList = GetSessionList();
                var pUser = from n in sessionList
                            where n.Codigo == user.Codigo
                            orderby n.Codigo
                            select n;

                foreach ( Usuario u in pUser )
                {
                    sessionList.Remove( u );
                }
                SaveSessionList( sessionList );
            } catch ( Exception ) { }
        }

        public static void CreateUserChatSession( Usuario user )
        {
            List<Usuario> sessionList = GetSessionList();
            var pUser = from n in sessionList
                        where n.Usuario_id == user.Usuario_id
                        orderby n.Codigo
                        select n;

            bool Exist = false;
            foreach ( Usuario u in pUser )
            {
                Exist = true;
                break;
            }
            if ( !Exist )
                sessionList.Add( user );
            else
                throw new Exception( "Usuario já cadastrado" );

            SaveSessionList( sessionList );
        }

        public static List<Mensagem> getMensagens( Usuario user )
        {
            List<Mensagem> lstmsg = new List<Mensagem>();

            string query = " SELECT `chat`.`Chat_id`, `chat`.`De_Usuario_id`, `chat`.`De`, `chat`.`Para_Usuario_id`, `chat`.`Para`, `chat`.`Mensagem`, `chat`.`Reservado`, `chat`.`dtMensagem`  ";
            query += " FROM `lecomcre_db`.`chat` ";
            query += " WHERE date_format(`chat`.`dtMensagem`, '%Y%m%d%H%i') >= '" + string.Format( "{0:yyyyMMddHHmm}", user.DtLogin.AddHours( -1 ) ) + "' ";
            query += " AND ((`chat`.`Reservado` = 0 OR `chat`.`Para` = '"+ user.UserName +"') ";
            query += " OR `chat`.`De` = '" + user.UserName + "'); ";

            using ( DataTable dt = Conn.ExecuteQuery( query ).Tables[ 0 ] )
            {
                Conn.CloseConnection();
                foreach ( DataRow dr in dt.Rows )
                {
                    Mensagem msg = new Mensagem()
                    {
                        De = Utils.getValor( dr, "De" ),
                        Para = Utils.getValor( dr, "Para" ),
                        HtmlMensagem = Utils.getValor( dr, "Mensagem" ),
                        DtMensagem = DateTime.Parse( Utils.getValor( dr, "dtMensagem" ) ),
                        Reservado = ( Utils.getValor( dr, "Reservado" ) == "0" ? false : true ),
                        De_Usuario_id = int.Parse( Utils.getValor( dr, "De_Usuario_id" ) ),
                        Para_Usuario_id = int.Parse( Utils.getValor( dr, "Para_Usuario_id" ) )

                    };
                    if ( !lstmsg.Contains( msg ) )
                        lstmsg.Add( msg );
                }
            }

            return lstmsg;

        }

        public static void AddMensagem( Mensagem msg )
        {
            msg.HtmlMensagem = TratarMensagem( msg );
            String query = "INSERT INTO `lecomcre_db`.`chat` ";
            query += " (`De_Usuario_id`, `Para_Usuario_id`, `Mensagem`,`Para`,`De`,`Reservado`) ";
            query += " VALUES ('" + msg.De_Usuario_id + "','" + msg.Para_Usuario_id + "','" + msg.HtmlMensagem + "','" + msg.Para + "','" + msg.De + "'," + ( msg.Reservado ? "1" : "0" ) + "); ";

            if ( Conn.CloseConnection() )
                Conn.ExecuteScalar( query );

        }

        private static String TratarMensagem( Mensagem msg )
        {
            String NewMSG = msg.HtmlMensagem;
            NewMSG = TratarHTML( NewMSG );
            NewMSG = TratarPalavroes( NewMSG );

            return NewMSG.Trim();
        }

        private static string TratarPalavroes( string NewMSG )
        {
            String[] ArryPalavroes = GetPalavroes();
            foreach ( string item in ArryPalavroes )
            {
                if ( NewMSG.IndexOf( item.Trim().ToLower() )>=0 )
                {
                    NewMSG = NewMSG.Replace( item, "#$#@$#%@# (Palavrão)" );
                }
            }
            return NewMSG;
        }

        private static string[] GetPalavroes()
        {
            List<string> lstp = new List<string>();

            using ( DataTable dt = Conn.ExecuteQuery( "SELECT `chat_palavroes`.`Palavra_id`, `chat_palavroes`.`Palavra` FROM `lecomcre_db`.`chat_palavroes`;" ).Tables[ 0 ] )
            {
                Conn.CloseConnection();
                foreach ( DataRow dr in dt.Rows )
                {
                    lstp.Add( Utils.getValor( dr, "Palavra" ).Trim().ToLower() );
                }
            }
            return lstp.ToArray();
        }

        private static string TratarHTML( string p )
        {
            String[] ArryHTML = { "br", "imput", "input", "type=", "value=", "textarea", "table", "tr", "td", "option", "div" };
            p = p.Replace( "'", "`" );
            foreach ( string item in ArryHTML )
            {
                if ( p.IndexOf( item.Trim().ToLower() ) >= 0 )
                {
                    p = p.Replace( item, "" ).Trim();
                }
            }
            return p;
        }


        public static List<Usuario> getUser()
        {
            try
            {
                List<Usuario> lst = new List<Usuario>();
                foreach ( Usuario u in GetSessionList() )
                {
                    if ( IsOnLine( u.IpUser ) )
                        lst.Add( u );
                }
                return lst;
            } catch ( Exception ex )
            {
                throw new Exception( "Erro para recuperar os usuários logado no bate-papo.", ex );
            }

        }

        public static bool IsOnLine( string ip )
        {
            try
            {
                Ping ping = new Ping();
                PingReply pingreply = ping.Send( ip );
                if ( pingreply != null )
                    return true;
                else
                    return false;
            } catch ( Exception )
            {
                return false;
            }
        }
    }
}
