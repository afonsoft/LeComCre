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
                            <asp:TextBox ID="txtNome" runat="server" Width="200px" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Sobrenome:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="200px" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Apelido:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="TextBox1" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Data de Nascimento:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            E-Mail:
                        </td>
                        <td class="td_dados">
                            <asp:TextBox ID="txtEMail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
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
                            </td>
                            <td class="td_dados">
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
                            </td>
                            <td class="td_dados">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
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
    </table>
</asp:Content>
