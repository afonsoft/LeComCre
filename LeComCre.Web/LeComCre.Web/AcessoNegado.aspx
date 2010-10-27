<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AcessoNegado.aspx.cs" Inherits="LeComCre.Web.AcessoNegado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
<table border="0" cellpadding="2" cellspacing="1" width="100%">
        <tr>
            <td align="center" valign="middle" colspan="2">
                <br />
                <h1>
                    Você não possui acesso a esse modulo.</h1>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" valign="middle">
                <img src="negado.jpg" />
            </td>
            <td align="left" valign="middle">
                <br />
                <h2>
                    Modulo acessado:
                    <asp:Label runat="server" ID="pagina" Text=""></asp:Label></h2>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle" colspan="2">
                <br />
                <h4>
                    Favor entrar em contado com o administrador.</h4>
                <br />
                <br />
            </td>
        </tr>
    </table>
 </asp:Content>


