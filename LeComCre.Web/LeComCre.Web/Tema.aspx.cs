﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Afonsoft.Libary.Cryptographic;
using LeComCre.Web.PageBase;
using LeComCre.Web.Negocios;
using AjaxControlToolkit;
using Afonsoft.Libary.Utilities;

namespace LeComCre.Web
{
    public partial class Tema : pageBaseSecurity
    {
        public bool NovoTema
        {
            get { try { return ( ViewState[ "NovoTema" ] != null ? ( ( bool )ViewState[ "NovoTema" ] ) : false ); } catch ( Exception ) { return false; }; }
            set { ViewState[ "NovoTema" ] = value; }
        }

        protected void Page_Load( object sender, EventArgs e )
        {
            try
            {
                string[] op;
                int idTema = 0;
                bool EditTema = false;
                ( ( MasterTemas )this.Master ).setUsuario = getNomeUsuarioLogado;
                if ( !IsPostBack )
                {
                    if ( Request.QueryString[ "p" ] != null )
                    {
                        try
                        {
                            op = Encryption.Descriptografar( Request.QueryString[ "p" ] ).Split( '|' );
                            idTema = int.Parse( op[ 0 ] );
                            EditTema = ( op[ 1 ] == "1" ? true : false );
                            NovoTema = ( op[ 1 ] == "2" ? true : false );

                        } catch ( Exception ex )
                        {
                            throw new Exception( "Parametros invalidos.", ex );
                        }
                    } else
                        throw new Exception( "Parametros invalidos." );
                    if ( !NovoTema )
                    {
                        tema ConteudoTema = new Temas().getTemaById( idTema );
                        ViewState.Add( "idTema", ConteudoTema.Tema_id );
                        if ( EditTema )
                        {
                            TemaHTML.Style[ "display" ] = "none";
                            EditTemaHTML.Style[ "display" ] = "block";
                            Editor1.Content = ConteudoTema.Texto;
                            txtDescricao.Text = ConteudoTema.Descricao;
                            txtTitulo.Text = ConteudoTema.Tema;
                            txtDataEvento.Text = Utils.FormatDate( ConteudoTema.DtEvento.ToString(), Utils.TipoData.Barra );
                        } else
                        {
                            TemaHTML.Style[ "display" ] = "block";
                            EditTemaHTML.Style[ "display" ] = "none";
                            lblTitulo.Text = ConteudoTema.Tema;
                            TextoHTML.InnerHtml = ConteudoTema.Texto;
                            lblData.Text = Utils.FormatDate( ConteudoTema.DtEvento.ToString(), Utils.TipoData.Barra );
                        }
                    } else
                    {
                        TemaHTML.Style[ "display" ] = "none";
                        EditTemaHTML.Style[ "display" ] = "block";
                    }

                }
            } catch ( Exception ex )
            {

                Alert( ex.Message );
                LogarErro( "(Tema.aspx) - Page_Load: " + ex.Message, ex );
            }
        }

        protected void btnSalvar_Click( object sender, EventArgs e )
        {
            try
            {
                if ( string.IsNullOrEmpty( txtTitulo.Text ) || string.IsNullOrEmpty( txtDescricao.Text ) || string.IsNullOrEmpty( Editor1.Content ) )
                {
                    Alert( "Favor preencher todos os campos" );
                    return;
                }
                tema t = new tema();
                t.Descricao = txtDescricao.Text.Trim();
                t.Tema = txtTitulo.Text.Trim();
                t.Texto = Editor1.Content.Trim();
                DateTime dt = DateTime.Now;
                DateTime.TryParse( Utils.FormatDate( txtDataEvento.Text, Utils.TipoData.Barra ), out dt );
                t.DtEvento = dt;
                string pg = ( string.IsNullOrEmpty(Request.QueryString[ "rtl" ]) ? Request.QueryString[ "rtl" ] : "temas.aspx" ); 
                Temas ts = new Temas();
                if ( NovoTema )
                {
                    ts.setNewTema( t );
                    Alert( "Inclusão do novo tema realizada com sucesso!", pg );
                } else
                {
                    t.Tema_id = int.Parse( ViewState[ "idTema" ].ToString() );
                    ts.setTemaById( t );
                    Alert( "Alteração realizada com sucesso!", pg );
                }
            } catch ( Exception ex )
            {
                Alert( ex.Message );
                LogarErro( "(Tema.aspx) - btnSalvar_Click: " + ex.Message, ex );
            }
        }
    }
}
