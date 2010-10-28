<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAssunto.ascx.cs" Inherits="LeComCre.Web.UserControl.ucAssunto" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <hr />
        </td>
    </tr>
    <tr>
        <td class="td_dados" onmouseout="this.style.backgroundColor='#FFFFFF'" onmouseover="this.style.backgroundColor='#D3D3D3'">
            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td class="td_Titulo" align="left" colspan="2">
                        <asp:Label ID="lblTitulo" runat="server" Text="Titulo Assunto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_dados" align="left" style="width: 90%;">
                        <asp:Label ID="lblAssunto" runat="server" Text="Assunto resumido"></asp:Label>
                    </td>
                    <td style="width: 10%; text-align: right;">
                        <asp:HyperLink ID="lnkAssunto" runat="server">Veja +</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
