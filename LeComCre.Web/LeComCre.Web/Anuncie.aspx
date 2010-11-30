<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAnunciar.master" AutoEventWireup="true"
    CodeBehind="Anuncie.aspx.cs" Inherits="LeComCre.Web.Anuncie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_dados">
                <span class="td_dados">Você empresa que deseja divulgar sua marca em nosso site preencha o formulário
                    ao lado que logo entraremos em contato. </span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <center>
        <table border="0" cellpadding="2" cellspacing="1" width="80%">
            <tr>
                <td class="td_dados" style="width: 100px;">
                    <span>Nome:</span>
                </td>
                <td class="td_dados" style="min-width: 350px; width: auto;">
                    <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Style="min-width: 350px; width: 98%;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados" style="width: 100px;">
                    <span>E-Mail:</span>
                </td>
                <td class="td_dados" style="min-width: 350px; width:auto;">
                    <asp:TextBox ID="txtMail" runat="server" MaxLength="50" Style="min-width: 350px; width: 98%;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados" style="width: 100px;">
                    <span>Telefone:</span>
                </td>
                <td class="td_dados" style="min-width: 350px; width: auto;">
                    <asp:TextBox ID="txtTelefone" runat="server" MaxLength="30" Style="min-width: 350px; width: 60%;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados" style="width: auto;" colspan="2">
                    <span>Descri&ccedil;&atilde;o:</span>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: auto;">
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="98%" Height="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados" style="width: 100px;">
                    <asp:Button ID="btnEnviar" CssClass="button" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
                </td>
                <td class="td_dados" style="min-width: 350px; width: auto;">
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
