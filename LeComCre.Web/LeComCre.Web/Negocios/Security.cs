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
        public void RegistrarHistorico(string Pagina, Usuario user)
        {
            try
            {
            }
            catch (Exception ex)
            {
                RegistrarErro("RegistrarHistorico", ex);
                throw ex;
            }
        }
        public void RegistrarErro(String Pagina, Exception ex)
        {
            String msg = (ex != null ? ex.Message : "Erro desconhecido");
            string Erro = (ex != null ? ex.StackTrace : "");
            string Query = "INSERT INTO `lecomcre_db`.`sistema_logs` (`Pagina`,`ErroTexto`,`ErroStack`) ";
            Query += "VALUES ('" + Pagina + "','"+ msg +"','" + Erro + "');";
            SQLConn.ExecuteNoQuery(Query);
        }

        
    }
}
