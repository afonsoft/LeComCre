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
            Usuario USER = null;
            string Query = "SELECT ";
            Query += "    `usuarios`.`Usuario_id`,";
            Query += "    `usuarios`.`Tipo_Usuario_id`,";
            Query += "    `usuarios`.`Nome`,";
            Query += "    `usuarios`.`SobreNome`,";
            Query += "    `usuarios`.`Apelido`,";
            Query += "    `usuarios`.`DtNascimento`,";
            Query += "    `usuarios`.`EMail`,";
            Query += "    `usuarios`.`Senha`,";
            Query += "    `usuarios`.`DtAlteracao`,";
            Query += "    `tipo_usuario`.`Tipo_Usuario_id`,";
            Query += "    `tipo_usuario`.`Perfil_id`,";
            Query += "    `tipo_usuario`.`Descricao`,";
            Query += "    `usuario_profissional`.`Profissao`,";
            Query += "    `usuario_profissional`.`Area`,";
            Query += "    `usuario_pai`.`CPF`,";
            Query += "    `usuario_pai`.`Pai_id`,";
            Query += "    `usuario_filho`.`Nome_Pai`,";
            Query += "    `usuario_filho`.`Nome_Mae`,";
            Query += "    `usuario_filho`.`Serie`,";
            Query += "    `usuario_filho`.`Nome_Escola`,";
            Query += "    `usuario_filho`.`Publica`,";
            Query += "    `usuario_filho`.`Filho_id`";
            Query += " FROM `lecomcre_db`.`usuarios` ";
            Query += " JOIN `lecomcre_db`.`tipo_usuario` ON `tipo_usuario`.`Tipo_Usuario_id` = `usuarios`.`Tipo_Usuario_id` ";
            Query += " LEFT JOIN `lecomcre_db`.`usuario_profissional` ON `usuario_profissional`.`Usuario_id` =  `usuarios`.`Tipo_Usuario_id` ";
            Query += " LEFT JOIN `lecomcre_db`.`usuario_pai` ON `usuario_pai`.`Usuario_id` = `usuarios`.`Tipo_Usuario_id` ";
            Query += " LEFT JOIN `lecomcre_db`.`usuario_filho` ON `usuario_filho`.`Usuario_id` = `usuarios`.`Tipo_Usuario_id` ";
            Query += "WHERE `usuarios`.`EMail` = '" + User + "'";
            Query += "AND `usuarios`.`Senha` = '" + Pass + "'";

            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    System.Data.DataRow dr = ds.Tables[0].Rows[0];
                    USER = new Usuario();
                    USER.Tipo_Usuario = new Tipo_Usuario();
                    USER.Usuario_Filha = new Usuario_Filha();
                    USER.Usuario_Pai = new Usuario_Pai();
                    USER.Usuario_Proficional = new Usuario_Proficional();
                    Utils.LoadObject(ds.Tables[0].Columns, dr, USER);
                    Utils.LoadObject(ds.Tables[0].Columns, dr, USER.Tipo_Usuario);
                    Utils.LoadObject(ds.Tables[0].Columns, dr, USER.Usuario_Filha);
                    Utils.LoadObject(ds.Tables[0].Columns, dr, USER.Usuario_Pai);
                    Utils.LoadObject(ds.Tables[0].Columns, dr, USER.Usuario_Proficional);
                }
                else
                    throw new Exception("Usuário ou senha inválido!");
            }
            else
                throw new Exception("Problema para recuperar as informações do usuario.");

            return USER;
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
