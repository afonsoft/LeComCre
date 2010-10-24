using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Afonsoft.Libary.Utilities;
using Afonsoft.Libary.Cryptographic;

namespace LeComCre.Web.Negocios
{
    public class Usuario
    {
        private int _Usuario_id;

        private int _Ativo;

        public int Ativo
        {
            get { return _Ativo; }
            set { _Ativo = value; }
        }

        private string _Host;

        public string Host
        {
            get { return _Host; }
            set { _Host = value; }
        }

        public int Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
        private Tipo_Usuario _tipo_Usuario;

        public Tipo_Usuario Tipo_Usuario
        {
            get { return _tipo_Usuario; }
            set { _tipo_Usuario = value; }
        }
        private string _Nome;

        public string Nome
        {
            get { return _Nome; }
            set { _Nome = value; }
        }
        private string _SobreNome;

        public string SobreNome
        {
            get { return _SobreNome; }
            set { _SobreNome = value; }
        }
        private string _Apelido;

        public string Apelido
        {
            get { return _Apelido; }
            set { _Apelido = value; }
        }
        private DateTime _DtNascimento;

        public DateTime DtNascimento
        {
            get { return _DtNascimento; }
            set { _DtNascimento = value; }
        }
        private string _EMail;

        public string EMail
        {
            get { return _EMail; }
            set { _EMail = value; }
        }
        private string _Senha;

        public string Senha
        {
            get { return _Senha; }
            set { _Senha = value; }
        }
        private DateTime _DtAlteracao;

        public DateTime DtAlteracao
        {
            get { return _DtAlteracao; }
            set { _DtAlteracao = value; }
        }
        private Usuario_Proficional _usuario_Proficional;

        public Usuario_Proficional Usuario_Proficional
        {
            get { return _usuario_Proficional; }
            set { _usuario_Proficional = value; }
        }
        private Usuario_Pai _usuario_Pai;

        public Usuario_Pai Usuario_Pai
        {
            get { return _usuario_Pai; }
            set { _usuario_Pai = value; }
        }
        private Usuario_Filha _usuario_Filha;

        public Usuario_Filha Usuario_Filha
        {
            get { return _usuario_Filha; }
            set { _usuario_Filha = value; }
        }

        private tpUsuario _TpUsuario;

        public tpUsuario TpUsuario
        {
            get { return _TpUsuario; }
            set { _TpUsuario = value; }
        }

    }

    public class Usuario_Proficional
    {
        private int _Usuario_id;

        public int Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
        private string _Profissao;

        public string Profissao
        {
            get { return _Profissao; }
            set { _Profissao = value; }
        }
        private string _Area;

        public string Area
        {
            get { return _Area; }
            set { _Area = value; }
        }
    }

    public class Usuario_Pai
    {
        private int _Usuario_id;

        public int Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
        private int _Pai_id;

        public int Pai_id
        {
            get { return _Pai_id; }
            set { _Pai_id = value; }
        }
        private string _CPF;

        public string CPF
        {
            get { return _CPF; }
            set { _CPF = value; }
        }
    }

    public class Usuario_Filha
    {
        private int _Usuario_id;

        public int Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
        private int _Filho_id;

        public int Filho_id
        {
            get { return _Filho_id; }
            set { _Filho_id = value; }
        }
        private int _Pai_id;

        public int Pai_id
        {
            get { return _Pai_id; }
            set { _Pai_id = value; }
        }
        private Usuario_Pai _usuario_Pai;

        public Usuario_Pai Usuario_Pai
        {
            get { return _usuario_Pai; }
            set { _usuario_Pai = value; }
        }
        private string _Nome_Pai;

        public string Nome_Pai
        {
            get { return _Nome_Pai; }
            set { _Nome_Pai = value; }
        }
        private string _Nome_Mae;

        public string Nome_Mae
        {
            get { return _Nome_Mae; }
            set { _Nome_Mae = value; }
        }
        private string _Serie;

        public string Serie
        {
            get { return _Serie; }
            set { _Serie = value; }
        }
        private string _Nome_Escola;

        public string Nome_Escola
        {
            get { return _Nome_Escola; }
            set { _Nome_Escola = value; }
        }
        private int _privatea;

        public int Publica
        {
            get { return _privatea; }
            set { _privatea = value; }
        }
    }

    public class Tipo_Usuario
    {
        private int _Tipo_Usuario_id;

        public int Tipo_Usuario_id
        {
            get { return _Tipo_Usuario_id; }
            set { _Tipo_Usuario_id = value; }
        }
        private int _Perfil_id;

        public int Perfil_id
        {
            get { return _Perfil_id; }
            set { _Perfil_id = value; }
        }
        private string _Descricao;

        public string Descricao
        {
            get { return _Descricao; }
            set { _Descricao = value; }
        }
    }

    public class Usuario_Log
    {
        private int _log_id;

        public int Log_id
        {
            get { return _log_id; }
            set { _log_id = value; }
        }
        private int _usuario_id;

        public int Usuario_id
        {
            get { return _usuario_id; }
            set { _usuario_id = value; }
        }
        private string _Url;

        public string Url
        {
            get { return _Url; }
            set { _Url = value; }
        }
        private string _IP;

        public string IP
        {
            get { return _IP; }
            set { _IP = value; }
        }
        private DateTime _DtAlteracao;

        public DateTime DtAlteracao
        {
            get { return _DtAlteracao; }
            set { _DtAlteracao = value; }
        }
    }

    public enum tpUsuario {  Administrador=1, Crianca=2, Adulto=3, Profissional=4 }

    public class NegUsuario
    {

        #region Insert Filho, User, Pai, Proficional
        private int InserrirUser(Usuario user)
        {
            string Query = "INSERT INTO `lecomcre_db`.`usuarios` (`Tipo_Usuario_id`, `Nome`, `SobreNome`, `Apelido`, `DtNascimento`, `EMail`, `Senha`, `Ativo`) ";
            Query += " VALUES ( " + (int)user.TpUsuario + ",'" + user.Nome + "','" + user.SobreNome + "','" + user.Apelido + "','" + Utils.FormatDate(user.DtNascimento.ToString("dd/MM/yyyy"), Utils.TipoData.SQL) + "','" + user.EMail + "','" + user.Senha + "',0); SELECT @@IDENTITY; ";
            object var = SQLConn.ExecuteScalar(Query);
            int rtl = 0;
            int.TryParse(var.ToString(), out rtl);
            return rtl;
        }

        private void InserirFilho(Usuario_Filha user, int idUsuario, int idPai)
        {
            string Query = "INSERT INTO `lecomcre_db`.`usuario_filho` (`Usuario_id`, `Pai_id`, `Nome_Pai`, `Nome_Mae`, `Serie`, `Nome_Escola`, `Publica`)  ";
            Query += " VALUES (" + idUsuario + ", " + idPai + ", '" + user.Nome_Pai + "','" + user.Nome_Mae + "','" + user.Serie + "','" + user.Nome_Escola + "'," + user.Publica + " ); ";
            SQLConn.ExecuteNoQuery(Query);
        }

        private void InserirPai(Usuario_Pai user, int idUsuario)
        {
            string Query = "INSERT INTO `lecomcre_db`.`usuario_pai` (`Usuario_id`, `CPF`) ";
            Query += " VALUES (" + idUsuario + ", '" + user.CPF + "');";
            SQLConn.ExecuteNoQuery(Query);
        }

        private void InserirProficional(Usuario_Proficional user, int idUsuario)
        {
            string Query = "INSERT INTO `lecomcre_db`.`usuario_profissional` (`Usuario_id`, `Profissao`, `Area`) ";
            Query += " VALUES (" + idUsuario + ",'" + user.Profissao + "','" + user.Area + "');";
            SQLConn.ExecuteNoQuery(Query);
        }
        #endregion

        public void IncluirUsuario(Usuario user)
        {
            try
            {
                string Query = "";
                System.Data.DataSet ds = null;
                SQLConn.BeginTransaction();

                Query = "SELECT * FROM `lecomcre_db`.`usuario_pai` WHERE `CPF` = '" + user.Usuario_Pai.CPF + "';";
                ds = SQLConn.ExecuteQuery(Query);

                if (user.TpUsuario == tpUsuario.Crianca)
                {
                    //Verificar se o pai já está cadastrado
                    if (ds.Tables[0].Rows.Count == 1)
                    {
                        int idPai = Utils.GetInteger(ds.Tables[0].Rows[0], "Pai_id");
                        int idUsuario = InserrirUser(user);
                        InserirFilho(user.Usuario_Filha, idUsuario, idPai);
                    }
                    else
                    {
                        throw new Exception("CPF do responsavel não está cadastrado no sistema como adulto.");
                    }
                }
                else if (user.TpUsuario == tpUsuario.Adulto)
                {
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        int idUsuario = InserrirUser(user);
                        InserirPai(user.Usuario_Pai, idUsuario);
                    }
                    else
                    {
                        throw new Exception("CPF já cadastrado no sistema.");
                    }
                }
                else if (user.TpUsuario == tpUsuario.Profissional)
                {
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        int idUsuario = InserrirUser(user);
                        InserirPai(user.Usuario_Pai, idUsuario);
                        InserirProficional(user.Usuario_Proficional, idUsuario);
                    }
                    else
                    {
                        throw new Exception("CPF já cadastrado no sistema.");
                    }
                }


                SQLConn.CommitTransaction();
            }
            catch (Exception ex) 
            {
                SQLConn.RollbackTransaction();
                throw new Exception("Erro para salvar o usuário: \n" + ex.Message, ex); 
            }
        }

        public void setUsuarioById(int idUsuario, int Ativo)
        {
            try
            {
                string Query = "UPDATE `lecomcre_db`.`usuarios` SET`Ativo` = " + Ativo + " WHERE `Usuario_id` = " + idUsuario + ";";
                SQLConn.ExecuteNoQuery(Query);
            }
            catch (Exception ex) { throw new Exception("Erro para alterar o usuario", ex); }
        }


        public void setUsuarioAtivo(int Ativo, int idUsuario)
        {
            string Query = "UPDATE `lecomcre_db`.`usuarios` SET `usuarios`.`Ativo` = " + Ativo + " WHERE `usuarios`.`Usuario_id` = " + idUsuario;
            SQLConn.ExecuteNoQuery(Query);
        }

        public Usuario[] getUsuariosInativos()
        {
            Usuario USER = null;
            List<Usuario> luser = new List<Usuario>();
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
            Query += "    `usuarios`.`Ativo`,";
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
            Query += "WHERE `usuarios`.`Ativo` = 0";

            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);

            foreach (System.Data.DataRow dr in ds.Tables[0].Rows)
            {
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

                luser.Add(USER);
            }

            return luser.ToArray();
        }

        #region getUsuarioByEmail

        public Usuario getUsuarioByEmail(string p)
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
            Query += "    `usuarios`.`Ativo`,";
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
            Query += "WHERE `usuarios`.`EMail` = '" + p + "'";
            Query += "AND `usuarios`.`Ativo` = 1";

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
                    throw new Exception("Usuario não encontrado!");
            }
            else
                throw new Exception("Usuario não encontrado ou inativo.");

            return USER;
        }
        #endregion

        #region Login do Usuario
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
            Query += "    `usuarios`.`Ativo`,";
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
            //Query += "AND `usuarios`.`Ativo` = 1";

            System.Data.DataSet ds = SQLConn.ExecuteQuery(Query);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    System.Data.DataRow dr = ds.Tables[0].Rows[0];

                    if (Utils.GetInteger(dr, "Ativo") == 0)
                        throw new Exception("Usuario bloqueado, entre em contato com o administrador.");

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
        #endregion

    }
}
