using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Cryptographic;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web.Negocios
{
    public class Security
    {
        

        public Usuario Login(String User, String Pass)
        {
            return new NegUsuario().Login(User, Pass);
        }
        
        public void RegistrarErro(String Pagina, Exception ex)
        {
            try
            {
                String msg = (ex != null ? ex.Message : "Erro desconhecido");
                string Erro = (ex != null ? ex.StackTrace : "");
                string Query = "INSERT INTO `lecomcre_db`.`sistema_logs` (`Pagina`,`ErroTexto`,`ErroStack`) ";
                Query += "VALUES ('" + Pagina + "','" + msg + "','" + Erro + "');";
                SQLConn.ExecuteNoQuery(Query);
            }
            catch (Exception) { }
        }

        public void LogarAcesso(string pagina, Usuario user)
        {
            try
            {
                string Query = "INSERT INTO `lecomcre_db`.`usuarios_log` (`Usuario_id`,`Url`,`IP`) ";
                Query += "VALUES (" + user.Usuario_id +",'" + pagina + "','" + user.Host +"');";
                SQLConn.ExecuteNoQuery(Query);
            }
            catch (Exception ex)
            {
                RegistrarErro("LogarAcesso", ex);
            }
        }
    }
}
