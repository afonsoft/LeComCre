<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCadastro.master" AutoEventWireup="true"
    CodeBehind="Cadastrar.aspx.cs" Inherits="LeComCre.Web.Cadastrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <div style="width: 100%; height: 100%; text-align: left; vertical-align: top;">
        <span class="td_dados">
            <br />
            Selecione ao lado quem você é.
        </span>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <div>
        <table width="80%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td align="left" class="td_dados" style="width: 5%;">
                    <asp:RadioButton ID="rdCrianca" runat="server" GroupName="gCadastrarUser" AutoPostBack="true"
                        OnCheckedChanged="rdCrianca_CheckedChanged" />
                </td>
                <td style="width: 48px; height: 48px;">
                    <img alt="Icone Crian&ccedil;a" src="images/RostoCrianca.png" width="48px" height="48px" />
                </td>
                <td align="left" class="td_dados" style="width: auto;">
                    <b>Crian&ccedil;a</b><br />
                    (Cadastro dos alunos)
                </td>
            </tr>
            <%-- <tr>
                <td align="left" class="td_dados" style="width: 5%;">
                    <asp:RadioButton ID="rdAdulto" runat="server" GroupName="gCadastrarUser" AutoPostBack="true"
                        OnCheckedChanged="rdAdulto_CheckedChanged" />
                </td>
                <td style="width: 30px; height: 30px;">
                    <img alt="Icone Adulto" src="images/RostoAdulto.png" width="48px" height="48px" />
                </td>
                <td align="left" class="td_dados" style="width: auto;">
                    <b>Adulto</b><br />
                    (Cadastros os pais)
                </td>
            </tr>--%>
            <tr>
                <td align="left" class="td_dados" style="width: 5%;">
                    <asp:RadioButton ID="rdProfissional" runat="server" GroupName="gCadastrarUser" AutoPostBack="true"
                        OnCheckedChanged="rdProfissional_CheckedChanged" />
                </td>
                <td style="width: 30px; height: 30px;">
                    <img alt="Icone Profissional" src="images/RostoAdulto.png" width="48px" height="48px" />
                </td>
                <td align="left" class="td_dados" style="width: auto;">
                    <b>Profissional</b><br />
                    (Cadastro de Profissional)
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
