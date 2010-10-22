<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"
    CodeBehind="NovoAssunto.aspx.cs" Inherits="LeComCre.Web.NovoAssunto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">
    <table width="100%" cellpadding="2" cellspacing="2" border="0">
        <tr>
            <td class="td_dados" style="width: 15%;">
                Assunto:
            </td>
            <td class="td_dados" style="width: 85%;">
                <asp:TextBox ID="txtAssunto" runat="server" Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_dados" style="width: auto;" colspan="2">
                Descri&ccedil;&atilde;o do Assunto:
            </td>
        </tr>
        <tr>
            <td class="td_dados" style="width: auto;" colspan="2">
                <asp:TextBox ID="txtDesc" runat="server" Width="98%" TextMode="MultiLine" Height="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_dados" style="width: auto;" colspan="2" align="right" valign="middle">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="button" OnClick="btnEnviar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
