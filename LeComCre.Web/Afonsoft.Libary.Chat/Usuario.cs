using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace Afonsoft.Libary.Chat
{
    [Serializable]
    public class Usuario
    {
        private bool _Ativo = false;

        public bool Ativo
        {
            get { return _Ativo; }
            set { _Ativo = value; }
        }

        private string _SessionId;

        public string SessionId
        {
            get { return _SessionId; }
            set { _SessionId = value; }
        }

        private String _pCodigo = "";

        public String Codigo
        {
            get { return _pCodigo; }
            set { _pCodigo = value; }
        }
        private String _UserName = String.Empty;

        public String UserName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }
        private DateTime _DtLogin = DateTime.Now;

        public DateTime DtLogin
        {
            get { return _DtLogin; }
            set { _DtLogin = value; }
        }
        private String _IpUser = "172.0.0.1";

        public String IpUser
        {
            get { return _IpUser; }
            set { _IpUser = value; }
        }
        private int _Usuario_id;

        public int Usuario_id
        {
            get { return _Usuario_id; }
            set { _Usuario_id = value; }
        }
    }
}
