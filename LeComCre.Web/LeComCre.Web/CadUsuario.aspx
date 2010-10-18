<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CadUsuario.aspx.cs" Inherits="LeComCre.Web.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <table width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Nome:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Sobrenome:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Apelido:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtApelido" runat="server" Width="50%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Data de Nascimento:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="50%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            E-Mail:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtEMail" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Senha:
                        </td>
                        <td class="td_dados">
                            <span style="font-family: Tahoma, Verdana; font-size: xx-small;">(O usuario ser&aacute;
                                o seu E-Mail)</span><br />
                            <asp:TextBox ID="txtSenha" runat="server" Width="130px" TextMode="Password" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivCrianca" runat="server" style="display: block;">
                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Nome do Pai:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtNomePai" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Nome da M&atilde;e:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtNomeMae" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                E-Mails dos Pais:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtMailsPais" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                CPF do Responsavel:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtCPFResponsavel" runat="server" Width="50%" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" colspan="2">
                                <table border="0" width="60%">
                                    <tr>
                                        <td colspan="2">
                                            Dados da Escola
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            S&eacute;rie:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSerieEscola" runat="server" MaxLength="30" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            <asp:RadioButton ID="rdPublica" runat="server" GroupName="gEscola" Text="Publica" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdPrivada" runat="server" GroupName="gEscola" Text="Privada" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30%">
                                            Nome:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomeEscola" runat="server" Width="100px" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivAdulto" runat="server" style="display: block;">
                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                CPF:
                            </td>
                            <td class="td_dados" colspan="3">
                                <asp:TextBox ID="txtCPF" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Res.:
                            </td>
                            <td class="td_dados" colspan="3">
                                <asp:TextBox ID="txtTelRes" runat="server" Width="60%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Cel.:
                            </td>
                            <td class="td_dados" colspan="3">
                                <asp:TextBox ID="txtTelCel" runat="server" Width="60%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Endere&ccedil;o:
                            </td>
                            <td class="td_dados" colspan="3">
                                <asp:TextBox ID="txtEndereco" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                N&uacute;mero:
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                <asp:TextBox ID="txtNum" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                Complemento:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtComplemento" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                Bairro:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtBairro" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                Cidade:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtCidade" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                Estado:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtEstado" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                CEP:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtCEP" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div id="DivProficional" runat="server" style="display: block;">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td style="width: 150px;" class="td_dados">
                                            </td>
                                            <td class="td_dados">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                E-Mails dos Filhos
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:ListBox ID="lstMailsFilhos" runat="server" Width="90%"></asp:ListBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button" />
            </td>
        </tr>
    </table>
</asp:Content>
