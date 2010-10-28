<%@ Page Title="" Language="C#" MasterPageFile="~/MenuDefault.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="LeComCre.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
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
                                <asp:TextBox ID="txtUsuario" runat="server" Width="180px" MaxLength="50" ValidationGroup="vGroup"></asp:TextBox>
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
                            <td colspan="2" align="left" class="td_dados">
                                <a href="RecuperarSenha.aspx">Esqueci minha senha</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" class="td_dados">
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
</asp:Content>
