using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeComCre.Web.Negocios
{
    public class Usuario
    {
        private int _Usuario_id;

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

        public int Privatea
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
}
