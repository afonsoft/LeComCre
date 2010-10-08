using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeComCre.Web.Negocios
{
    public class Usuario
    {
        public int Usuario_id;
        public Tipo_Usuario tipo_Usuario;
        public string Nome;
        public string SobreNome;
        public string Apelido;
        public DateTime DtNascimento;
        public string EMail;
        public string Senha;
        public string IpUser;
        public DateTime DtAlteracao;
        public Usuario_Proficional usuario_Proficional;
        public Usuario_Pai usuario_Pai;
        public Usuario_Filha usuario_Filha;
    }

    public class Usuario_Proficional
    {
        public int Usuario_id;
        public string Profissao;
        public string Area;
    }
    public class Usuario_Pai
    {
        public int Usuario_id;
        public int Pai_id;
        public string CPF;
    }
    public class Usuario_Filha
    {
        public int Usuario_id;
        public int Filho_id;
        public int Pai_id;
        public Usuario_Pai usuario_Pai;
        public string Nome_Pai;
        public string Nome_Mae;
        public string Serie;
        public string Nome_Escola;
        public int Publica;
    }
    public class Tipo_Usuario
    {
        public int Tipo_Usuario_id;
        public int Perfil_id;
        public string Descricao;
    }
}
