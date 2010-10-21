<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAssunto.ascx.cs" Inherits="LeComCre.Web.UserControl.ucAssunto" %>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
        <td>
        <div id="lnkAssunto" onclick="" runat="server">
            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td class="td_Titulo" align="left">
                        <asp:Label ID="lblTitulo" runat="server" Text="Titulo Assunto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_dados" align="left">
                        <asp:Label ID="lblAssunto" runat="server" Text="Assunto resumido"></asp:Label>
                    </td>
                </tr>
            </table>
            </div>
        </td>
    </tr>
</table>
