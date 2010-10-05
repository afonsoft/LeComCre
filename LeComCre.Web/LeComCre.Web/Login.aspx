<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="LeComCre.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
    <style type="text/css">
        .td_menu
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: White;
            text-align: left;
            font-size: 13px;
        }
        a:link
        {
            text-decoration: none;
        }
        a:visited
        {
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline overline;
        }
        .td_texto
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            font-size: 12px;
            font-weight: bold;
        }
        .td_Titulo
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            font-size: 13px;
        }
        .td_dados
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            vertical-align: top;
            font-size: 12px;
        }
        .td_label
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: White;
            background-color: Gray;
            text-align: left;
            vertical-align: top;
            font-size: 12px;
        }
        .button
        {
            border: 1px solid #BBBBBB;
            font-size: 11px;
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            font-weight: bold;
            color: #888888;
            width: 100px;
            background-color: #EEEEEE;
            width: 100px;
        }
        .tabela_login
        {
            visibility: visible;
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            font-size: 12px;
            display: block;
            font-weight: normal;
            color: #000000;
            vertical-align: middle;
            text-align: left;
            border: thin solid #000000;
            width: 280px;
            height: auto;
        }
        .Mensagem
        {
            font-family: Verdana, Arial;
            font-size: x-small;
            font-style: normal;
            color: Black;
        }
        .GridLinkButton
        {
            font-family: Verdana, Arial;
            font-size: x-small;
            font-style: normal;
            color: Gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <script type="text/javascript" language="javascript">
        jQuery(document).ready(new function() {
            debugger;
            var dlg = jQuery('#DialogSenha').dialog({
                title: 'Reenvio da senha',
                width: 350,
                height: 200,
                resizable: true,
                autoOpen: false,
                bgiframe: false,
                modal: true,
                width: 350,
                height: 180,
                open: function(type, data) { jQuery('#DialogSenha').parent().appendTo("form"); },
                buttons: {
                    "Sair": function() { jQuery('#DialogSenha').dialog("close"); },
                    "Reenviar": function() { jQuery('#DialogSenha').dialog("close"); }
                }
            });
            //Associando o form para efetuar o postback
            dlg.parent().appendTo(jQuery("form:first"));
        });

        function loadSenha(event) {
            jQuery(document).ready(function() {
                jQuery('#DialogSenha').dialog('open');
                return true;
            });
            return true;
        }
        
    </script>

    <div id="MainLogin" style="vertical-align: top; text-align: center; width: 100%;"
        runat="server">
        <table width="100%">
            <tr>
                <td align="center" valign="middle">
                    <br />
                    <br />
                    <table id="table1" class="tabela_login" cellpadding="2" cellspacing="2">
                        <tr>
                            <td colspan="2" class="td_Titulo">
                                Login
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" align="left">
                                Usuário:
                            </td>
                            <td align="left" class="td_dados">
                                <asp:TextBox ID="txtUsuario" runat="server" Width="200px" MaxLength="50" ValidationGroup="vGroup"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario"
                                    Display="Dynamic" ErrorMessage="Nome do Usuário obrigatório." ValidationGroup="vGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" align="left">
                                Senha:
                            </td>
                            <td align="left" class="td_dados">
                                <asp:TextBox ID="txtSenha" runat="server" Width="120px" MaxLength="10" ValidationGroup="vGroup"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSenha"
                                    Display="Dynamic" ErrorMessage="Senha é obrigatório." ValidationGroup="vGroup">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnLogar" runat="server" CssClass="button" OnClick="btnLogar_Click"
                                    Text="Entrar" ValidationGroup="vGroup" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left">
                                <a href="#" onclick="loadSenha(this);return false;">Esqueci minha senha</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left">
                                <a href="Cadastrar.aspx">Se cadastrar</a>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div id="DialogSenha" title="Aviso" style="display: none; font-size: x-small; color: Black;
        font-family: Verdana; font-style: normal; font-weight: normal;" class="ui-dialog ui-resizable-handle">
        <table>
            <tr>
                <td colspan="2" class="td_dados">
                    <b>Recuperar a senha</b>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    E-Mail:&nbsp;
                </td>
                <td class="td_dados">
                    &nbsp;<asp:TextBox ID="txtMail" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="td_dados" align="center">
                    <asp:Button ID="btnReenviarSenha" runat="server" CssClass="button" Text="Enviar"
                        OnClick="btnReenviarSenha_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
