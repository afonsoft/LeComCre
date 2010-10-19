<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CadUsuario.aspx.cs" Inherits="LeComCre.Web.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <table width="600px" border="0" cellpadding="1" cellspacing="1">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Nome:
                        </td>
                        <td class="td_dados" style="width:450px;">
                            <asp:TextBox ID="txtNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Sobrenome:
                        </td>
                        <td class="td_dados" style="width:450px;">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Apelido:
                        </td>
                        <td class="td_dados" style="width:450px;">
                            <asp:TextBox ID="txtApelido" runat="server" Width="50%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Data de Nascimento:
                        </td>
                        <td class="td_dados" style="width:450px;">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="50%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            E-Mail:
                        </td>
                        <td class="td_dados" style="width:450px;">
                            <asp:TextBox ID="txtEMail" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Senha:
                        </td>
                        <td class="td_dados" style="width:450px;">
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
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td class="td_dados" style="width:150px;">
                                Nome do Pai:
                            </td>
                            <td class="td_dados" style="width:450px;">
                                <asp:TextBox ID="txtNomePai" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width:150px;">
                                Nome da M&atilde;e:
                            </td>
                            <td class="td_dados" style="width:450px;">
                                <asp:TextBox ID="txtNomeMae" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width:150px;">
                                E-Mails dos Pais:
                            </td>
                            <td class="td_dados" style="width:450px;">
                                <asp:TextBox ID="txtMailsPais" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width:150px;">
                                CPF do Responsavel:
                            </td>
                            <td class="td_dados" style="width:450px;">
                                <asp:TextBox ID="txtCPFResponsavel" runat="server" Width="50%" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" colspan="2" style="width:auto;">
                                <table border="0" width="100%">
                                    <tr>
                                        <td colspan="2">
                                            Dados da Escola
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            S&eacute;rie:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSerieEscola" runat="server" MaxLength="30" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:RadioButton ID="rdPublica" runat="server" GroupName="gEscola" Text="Publica" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdPrivada" runat="server" GroupName="gEscola" Text="Privada" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            Nome:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomeEscola" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
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
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                CPF:
                            </td>
                            <td class="td_dados" colspan="3" style="width:450px;">
                                <asp:TextBox ID="txtCPF" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Res.:
                            </td>
                            <td class="td_dados" colspan="3" style="width:450px;">
                                <asp:TextBox ID="txtTelRes" runat="server" Width="60%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Cel.:
                            </td>
                            <td class="td_dados" colspan="3" style="width:450px;">
                                <asp:TextBox ID="txtTelCel" runat="server" Width="60%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Endere&ccedil;o:
                            </td>
                            <td class="td_dados" colspan="3" style="width:450px;">
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
                            <td class="td_dados" style="width: 200px;">
                                <asp:TextBox ID="txtComplemento" runat="server" Width="85%"></asp:TextBox>
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
                            <td class="td_dados" style="width: 200px;">
                                <asp:TextBox ID="txtCidade" runat="server" Width="85%"></asp:TextBox>
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
                            <td class="td_dados" style="width: 200px;">
                                <asp:TextBox ID="txtCEP" runat="server" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div id="DivProficional" runat="server" style="display: block;">
                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td style="width: 150px;" class="td_dados">
                                                Profiss&atilde;o:
                                            </td>
                                            <td class="td_dados">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_dados" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td style="width: 50px;" class="td_dados">
                                                        </td>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdPedagogo" Text="Pedagogo" runat="server" GroupName="gProfissao" /><br />
                                                            <asp:RadioButton ID="rdPisicologo" Text="Pisicologo" runat="server" GroupName="gProfissao" /><br />
                                                            <asp:RadioButton ID="rdFonoaudiologo" Text="Fonoaudiologo" runat="server" GroupName="gProfissao" /><br />
                                                            <asp:RadioButton ID="rdOutros" Text="Outros" runat="server" GroupName="gProfissao" />
                                                            &nbsp;<asp:TextBox ID="txtOutraProfissao" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px;" class="td_dados">
                                                &Aacute;rea de Atua&ccedil;&atilde;o:
                                            </td>
                                            <td class="td_dados">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table>
                                                    <tr>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoPublica" Text="Publica" runat="server" GroupName="gAreAtuacao" />
                                                        </td>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoPrivada" Text="Privada" runat="server" GroupName="gAreAtuacao" />
                                                        </td>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoNenhuma" Text="Nenhuma" runat="server" GroupName="gAreAtuacao" />
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
                            <td colspan="4" class="td_dados">
                                E-Mails dos Filhos
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td_dados">
                                <asp:ListBox ID="lstMailsFilhos" runat="server" Width="90%"></asp:ListBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button" OnClick="btnSalvar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
