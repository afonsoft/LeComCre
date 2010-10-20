using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web.Negocios
{
    public class Assuntos
    {
        public assunto[] getAllAssunto()
        {
            List<assunto> lstT = new List<assunto>();
            assunto t = null;
            string Query = "SELECT `assuntos`.`Assunto_id`,`assuntos`.`Usuario_id`,`assuntos`.`Assunto`,`assuntos`.`Descricao`,`assuntos`.`Ativo`,`assuntos`.`DtAlteracao`,`usuarios`.`Usuario_id`,`usuarios`.`Tipo_Usuario_id`,`usuarios`.`Nome`,`usuarios`.`SobreNome`,`usuarios`.`Apelido`,`usuarios`.`DtNascimento`,`usuarios`.`EMail`,`usuarios`.`Senha`,`usuarios`.`DtAlteracao` ";
            Query += " FROM `lecomcre_db`.`assuntos`, `lecomcre_db`.`usuarios` WHERE `assuntos`.`Usuario_id` = `usuarios`.`Usuario_id` ";
            Query += " ORDER BY `assuntos`.`DtAlteracao` DESC LIMIT 0, 1000; ";
            
            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);
            foreach (System.Data.DataRow dr in ds.Tables[0].Rows)
            {
                t = new assunto();
                t.Usuario = new Usuario();
                Utils.LoadObject(ds.Tables[0].Columns, dr, t);
                Utils.LoadObject(ds.Tables[0].Columns, dr, t.Usuario);
                lstT.Add(t);
            }
            return lstT.ToArray();
        }

        public assunto getAssuntoById(int id)
        {
            assunto t = new assunto();
            t.Usuario = new Usuario();

            string Query = "SELECT `assuntos`.`Assunto_id`,`assuntos`.`Usuario_id`,`assuntos`.`Assunto`,`assuntos`.`Descricao`,`assuntos`.`Ativo`,`assuntos`.`DtAlteracao`,`usuarios`.`Usuario_id`,`usuarios`.`Tipo_Usuario_id`,`usuarios`.`Nome`,`usuarios`.`SobreNome`,`usuarios`.`Apelido`,`usuarios`.`DtNascimento`,`usuarios`.`EMail`,`usuarios`.`Senha`,`usuarios`.`DtAlteracao` ";
            Query += " FROM `lecomcre_db`.`assuntos`, `lecomcre_db`.`usuarios` WHERE `assuntos`.`Usuario_id` = `usuarios`.`Usuario_id` ";
            Query += " AND `assuntos`.`Assunto_id` = " + id;
            Query += " ORDER BY `assuntos`.`DtAlteracao` DESC LIMIT 0, 1000; ";
            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);

            Utils.LoadObject(ds.Tables[0].Columns, ds.Tables[0].Rows[0], t);
            Utils.LoadObject(ds.Tables[0].Columns, ds.Tables[0].Rows[0], t.Usuario);

            return t;
        }
        public assunto[] getAssuntoByIdUsuario(int idUsuario)
        {
            List<assunto> lstT = new List<assunto>();
            assunto t = null;
            string Query = "SELECT `assuntos`.`Assunto_id`,`assuntos`.`Usuario_id`,`assuntos`.`Assunto`,`assuntos`.`Descricao`,`assuntos`.`Ativo`,`assuntos`.`DtAlteracao`,`usuarios`.`Usuario_id`,`usuarios`.`Tipo_Usuario_id`,`usuarios`.`Nome`,`usuarios`.`SobreNome`,`usuarios`.`Apelido`,`usuarios`.`DtNascimento`,`usuarios`.`EMail`,`usuarios`.`Senha`,`usuarios`.`DtAlteracao` ";
            Query += " FROM `lecomcre_db`.`assuntos`, `lecomcre_db`.`usuarios` WHERE `assuntos`.`Usuario_id` = `usuarios`.`Usuario_id` ";
            Query += " AND `assuntos`.`Usuario_id` = " + idUsuario;
            Query += " ORDER BY `assuntos`.`DtAlteracao` DESC LIMIT 0, 1000; ";

            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);
            foreach (System.Data.DataRow dr in ds.Tables[0].Rows)
            {
                t = new assunto();
                t.Usuario = new Usuario();
                Utils.LoadObject(ds.Tables[0].Columns, dr, t);
                Utils.LoadObject(ds.Tables[0].Columns, dr, t.Usuario);
                lstT.Add(t);
            }
            return lstT.ToArray();
        }

        public assunto[] getAssuntoByName(string Desc)
        {
            List<assunto> lstT = new List<assunto>();
            assunto t = null;
            string Query = "SELECT `assuntos`.`Assunto_id`,`assuntos`.`Usuario_id`,`assuntos`.`Assunto`,`assuntos`.`Descricao`,`assuntos`.`Ativo`,`assuntos`.`DtAlteracao`,`usuarios`.`Usuario_id`,`usuarios`.`Tipo_Usuario_id`,`usuarios`.`Nome`,`usuarios`.`SobreNome`,`usuarios`.`Apelido`,`usuarios`.`DtNascimento`,`usuarios`.`EMail`,`usuarios`.`Senha`,`usuarios`.`DtAlteracao` ";
            Query += " FROM `lecomcre_db`.`assuntos`, `lecomcre_db`.`usuarios` WHERE `assuntos`.`Usuario_id` = `usuarios`.`Usuario_id` ";
            Query += " AND `assuntos`.`Descricao` LIKE '%" + Desc + "%' ";
            Query += " ORDER BY `assuntos`.`DtAlteracao` DESC LIMIT 0, 1000; ";

            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);
            foreach (System.Data.DataRow dr in ds.Tables[0].Rows)
            {
                t = new assunto();
                t.Usuario = new Usuario();
                Utils.LoadObject(ds.Tables[0].Columns, dr, t);
                Utils.LoadObject(ds.Tables[0].Columns, dr, t.Usuario);
                lstT.Add(t);
            }
            return lstT.ToArray();
        }

        public void setAssuntoById(assunto texto)
        {
        }
        public void setNewAssunto(assunto texto)
        {
        }
    }

    public class assunto
    {
        private Usuario _usuario;

        public Usuario Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }
        
        private int _Assunto_id;

        public int Assunto_id
        {
            get { return _Assunto_id; }
            set { _Assunto_id = value; }
        }
        private string _Usuario_id;

        public string Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
        private string _Assunto;

        public string Assunto
        {
            get { return _Assunto; }
            set { _Assunto = value; }
        }
        private string _Descricao;

        public string Descricao
        {
            get { return _Descricao; }
            set { _Descricao = value; }
        }
        private string _Ativo;

        public string Ativo
        {
            get { return _Ativo; }
            set { _Ativo = value; }
        }
        private DateTime _DtAlteracao;

        public DateTime DtAlteracao
        {
            get { return _DtAlteracao; }
            set { _DtAlteracao = value; }
        }
    }
}
