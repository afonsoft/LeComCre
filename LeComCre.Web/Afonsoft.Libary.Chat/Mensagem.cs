using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace Afonsoft.Libary.Chat
{
    [Serializable]
    public class Mensagem
    {
        private String _de;

        private int _De_Usuario_id;

        public int De_Usuario_id
        {
            get { return _De_Usuario_id; }
            set { _De_Usuario_id = value; }
        }
        private int _Para_Usuario_id;

        public int Para_Usuario_id
        {
            get { return _Para_Usuario_id; }
            set { _Para_Usuario_id = value; }
        }

        public String De
        {
            get { return _de; }
            set { _de = value; }
        }
        private String _Para;

        public String Para
        {
            get { return _Para; }
            set { _Para = value; }
        }
        private String _HtmlMensagem = string.Empty;

        public String HtmlMensagem
        {
            get { return _HtmlMensagem; }
            set { _HtmlMensagem = value; }
        }
        private DateTime _dtMensagem = DateTime.Now;

        public DateTime DtMensagem
        {
            get { return _dtMensagem; }
            set { _dtMensagem = value; }
        }
        private bool _Reservado = false;

        public bool Reservado
        {
            get { return _Reservado; }
            set { _Reservado = value; }
        }
    
    }
}
