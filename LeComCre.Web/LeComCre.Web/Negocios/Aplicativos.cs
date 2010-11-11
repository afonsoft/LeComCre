using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Utilities;
using Afonsoft.Libary.Cryptographic;
using System.Data;

namespace LeComCre.Web.Negocios
{
    public class Aplicativos
    {
        #region Jogos

        private string QueryJogo = " SELECT `jogos`.`Jogo_id`,`jogos`.`Nome`,`jogos`.`Url`,`jogos`.`dtEvento`,`jogos`.`dtAlteracao`FROM `lecomcre_db`.`jogos` ";
        public DataSet getJogos()
        {
            return getJogosByName( "" );
        }
        public DataSet getJogosById( int idJogo )
        {
            string Query = QueryJogo;
            Query += " WHERE `jogos`.`Jogo_id` = " + idJogo + ";";

            return SQLConn.ExecuteQuery( Query );
        }
        public DataSet getJogosByName( string nome )
        {
            string Query = QueryJogo;
            Query += " WHERE `jogos`.`Nome` LIKE '%" + nome + "%';";

            return SQLConn.ExecuteQuery( Query );
        }
        public void deleteJogoById( int idJogo )
        {
            string Query = "DELETE FROM `lecomcre_db`.`jogos` WHERE `jogos`.`Jogo_id` = " + idJogo + ";";
            SQLConn.ExecuteNoQuery( Query );
        }
        public void newJogo( string nome, string url, string dt )
        {
            string Query = "INSERT INTO `lecomcre_db`.`jogos` (`Nome`, `Url`, `dtEvento`) ";
            Query += " VALUES ('" + nome + "','" + url + "'," + ( string.IsNullOrEmpty( dt ) ? "NULL" : "'" + Utils.FormatDate( dt, Utils.TipoData.SQL ) + "'" ) + "); ";

            SQLConn.ExecuteNoQuery( Query );
        }
        #endregion

        #region Colorir

        private string QueryColorir = " SELECT `colorir`.`Colorir_id`, `colorir`.`descricao`, `colorir`.`url`, `colorir`.`dtEvento`, `colorir`.`dtAlteracao` FROM `lecomcre_db`.`colorir` ";

        public DataSet getColorir()
        {
            return getColorirByName( "" );
        }
        public DataSet getColorirById( int idColorir )
        {
            string Query = QueryColorir;
            Query += " WHERE `colorir`.`Colorir_id` = " + idColorir + ";";

            return SQLConn.ExecuteQuery( Query );
        }

        public DataSet getColorirByName( string nome )
        {
            string Query = QueryColorir;
            Query += " WHERE `colorir`.`descricao` LIKE '%" + nome + "%';";

            return SQLConn.ExecuteQuery( Query );
        }

        public void deleteColorirById( int idColorir )
        {
            string Query = "DELETE FROM `lecomcre_db`.`colorir` WHERE `colorir`.`Colorir_id` = " + idColorir + ";";
            SQLConn.ExecuteNoQuery( Query );
        }

        public void newColorir( string nome, string url, string dt )
        {
            string Query = "INSERT INTO `lecomcre_db`.`colorir` (`descricao`, `url`,`dtEvento`) ";
            Query += " VALUES ('" + nome + "','" + url + "'," + ( string.IsNullOrEmpty( dt ) ? "NULL" : "'" + Utils.FormatDate( dt, Utils.TipoData.SQL ) + "'" ) + "); ";

            SQLConn.ExecuteNoQuery( Query );
        }

        #endregion
    }
}
