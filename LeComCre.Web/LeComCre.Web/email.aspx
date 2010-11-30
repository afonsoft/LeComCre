<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContato.Master" AutoEventWireup="true"
    CodeBehind="email.aspx.cs" Inherits="LeComCre.Web.email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <center>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="2" cellspacing="1" width="70%">
                    <tr>
                        <td class="td_dados" style="width: 100px;">
                            <span>Nome:</span>
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                            <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_dados" style="width: 100px;">
                            <span>E-Mail:</span>
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                            <asp:TextBox ID="txtMail" runat="server" MaxLength="50" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_dados" style="width: 100px;">
                            <span>CPF:</span>
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                            <asp:TextBox ID="txtCPF" runat="server" MaxLength="20" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_dados" style="width: 100px;">
                            <span>Assunto:</span>
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                            <asp:DropDownList ID="ddlAssunto" runat="server" Width="80%" OnSelectedIndexChanged="ddlAssunto_SelectedIndexChanged"
                                AutoPostBack="True">
                                <asp:ListItem Text="Informa&ccedil;&otilde;es" Value="Informa&ccedil;&otilde;es" />
                                <asp:ListItem Text="Suporte" Value="Suporte" />
                                <asp:ListItem Text="Erros" Value="Erros" />
                                <asp:ListItem Text="Outros" Value="Outros" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_dados" style="width: 100px;">
                            <span>Descri&ccedil;&atilde;o:</span>
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                            <asp:TextBox ID="txtOutros" runat="server" MaxLength="40" Width="95%" Style="display: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="98%" Height="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_dados">
                            <asp:Button ID="btnEnviar" CssClass="button" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
                        </td>
                        <td class="td_dados" style="min-width: 350px; width: auto;">
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnEnviar" />
                <asp:AsyncPostBackTrigger ControlID="ddlAssunto" EventName="selectedindexchanged" />
            </Triggers>
        </asp:UpdatePanel>
    </center>
</asp:Content>
