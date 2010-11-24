<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNegado.Master" AutoEventWireup="true"
    CodeBehind="AcessoNegado.aspx.cs" Inherits="LeComCre.Web.AcessoNegado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <table border="0" cellpadding="2" cellspacing="1" width="100%">
        <tr>
            <td align="center" valign="middle" colspan="2">
                <br />
                <h3>
                    Voc&ecirc; n&atilde;o possui acesso a esse modulo.</h3>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" valign="middle">
                <img alt="Acesso Negado" src="images/negado.jpg" width="64px" height="64px" />
            </td>
            <td align="left" valign="middle">
                <br />
                <h4>
                    Modulo acessado:
                    <asp:Label runat="server" ID="pagina" Text=""></asp:Label></h4>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle" colspan="2">
                <br />
                <h5>
                    Favor entrar em <a href="email.aspx">contado</a> com o administrador.</h5>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
