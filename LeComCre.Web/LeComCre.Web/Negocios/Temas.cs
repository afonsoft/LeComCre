using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web.Negocios
{
    public class Temas
    {
        public tema[] getAllTema()
        {
            List<tema> lstT = new List<tema>();
            tema t = null;
            string Query = "SELECT ";
            Query += " `temas`.`Tema_id`, `temas`.`Tema`, `temas`.`Descricao`, `temas`.`Texto`, `temas`.`DtEvento`, `temas`.`DtAlteracao` FROM `lecomcre_db`.`temas` ";
            Query += "ORDER BY `temas`.`DtAlteracao` DESC LIMIT 0, 20;";
            System.Data.DataSet ds = SQLConn.ExecuteQuery( Query );
            foreach ( System.Data.DataRow dr in ds.Tables[ 0 ].Rows )
            {
                t = new tema();
                Utils.LoadObject( ds.Tables[ 0 ].Columns, dr, t );
                lstT.Add( t );
            }
            return lstT.ToArray();
        }

        public tema getTemaById( int id )
        {
            tema t = new tema();

            string Query = "SELECT ";
            Query += " `temas`.`Tema_id`, `temas`.`Tema`, `temas`.`Descricao`, `temas`.`Texto`, `temas`.`DtEvento`, `temas`.`DtAlteracao` FROM `lecomcre_db`.`temas` ";
            Query += "WHERE `temas`.`Tema_id` = " + id + ";";
            System.Data.DataSet ds = SQLConn.ExecuteQuery( Query );

            Utils.LoadObject( ds.Tables[ 0 ].Columns, ds.Tables[ 0 ].Rows[ 0 ], t );

            return t;
        }

        public void setTemaById( tema texto )
        {
            string Query = "UPDATE `lecomcre_db`.`temas` ";
            Query += " SET `Tema` = '" + Utils.TrataStringToSQL( texto.Tema) + "', `Descricao` = '" + Utils.TrataStringToSQL(texto.Descricao) + "', `Texto` = '" + Utils.TrataStringToSQL(texto.Texto) + "', `DtEvento` = '" + Utils.FormatDate( texto.DtEvento, Utils.TipoData.SQL ) + "' ";
            Query += " WHERE `Tema_id` = " + texto.Tema_id + "; ";
            SQLConn.ExecuteNoQuery( Query );
        }

        public void setNewTema( tema texto )
        {
            string Query = " INSERT INTO `lecomcre_db`.`temas` (`Tema`, `Descricao`, `Texto`, `DtEvento`) ";
            Query += " VALUES ('" + Utils.TrataStringToSQL(texto.Tema) + "','" + Utils.TrataStringToSQL(texto.Descricao) + "','" + Utils.TrataStringToSQL(texto.Texto) + "','" + Utils.FormatDate( texto.DtEvento, Utils.TipoData.SQL ) + "'); ";
            SQLConn.ExecuteNoQuery( Query );
        }
    }

    public class tema
    {
        private int _Tema_id;

        public int Tema_id
        {
            get { return _Tema_id; }
            set { _Tema_id = value; }
        }
        private string _Tema;

        public string Tema
        {
            get { return _Tema; }
            set { _Tema = value; }
        }
        private string _Descricao;

        public string Descricao
        {
            get { return _Descricao; }
            set { _Descricao = value; }
        }
        private string _Texto;

        public string Texto
        {
            get { return _Texto; }
            set { _Texto = value; }
        }
        private DateTime _DtEvento;

        public DateTime DtEvento
        {
            get { return _DtEvento; }
            set { _DtEvento = value; }
        }
        private DateTime _DtAlteracao;

        public DateTime DtAlteracao
        {
            get { return _DtAlteracao; }
            set { _DtAlteracao = value; }
        }
    }
}
