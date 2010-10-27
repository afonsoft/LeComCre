<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTemaSimples.ascx.cs"
    Inherits="LeComCre.Web.UserControl.ucTemaSimples" %>
<table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-color: #F9f6bd;">
    <tr>
        <td>
            <table border="0" cellpadding="1" cellspacing="3" width="100%">
                <tr>
                    <td class="td_Titulo" align="left" colspan="2">
                        <asp:Label ID="lblTitle" runat="server" Text="Texto do Titulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_dados" align="left" colspan="2">
                        <asp:Label ID="lblDescricao" runat="server" Text="Texto da descrição"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_dados" style="width: 70%">
                        <asp:HiddenField ID="HiddenCodigo" runat="server" Value="" />
                    </td>
                    <td class="td_dados" align="center" style="width: 30%">
                        <a href="" id="lnkButtonDetalhe" runat="server">Mais Detalhes...</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
