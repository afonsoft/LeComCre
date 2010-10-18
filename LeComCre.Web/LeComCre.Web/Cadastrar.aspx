<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Cadastrar.aspx.cs" Inherits="LeComCre.Web.Cadastrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div>
        <table width="80%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td align="left" class="details" style="width:30%;">
                    <asp:RadioButton ID="rdCrianca" runat="server" GroupName="gCadastrarUser" 
                        AutoPostBack="true" oncheckedchanged="rdCrianca_CheckedChanged" />
                    <img alt="Icone Crian&ccedil;a" src="" />
                </td>
                <td align="left" class="details" style="width:auto;">
                    <b>Crian&ccedil;a</b><br />
                    (Descri&ccedil;&atilde;o)
                </td>
            </tr>
            <tr>
                <td align="left" class="details" style="width:30%;">
                    <asp:RadioButton ID="rdAdulto" runat="server" GroupName="gCadastrarUser" 
                        AutoPostBack="true" oncheckedchanged="rdAdulto_CheckedChanged" />
                    <img alt="Icone Adulto" src="" />
                </td>
                <td align="left" class="details" style="width:auto;">
                    <b>Adulto</b><br />
                    (Descri&ccedil;&atilde;o)
                </td>
            </tr>
            <tr>
                <td align="left" class="details" style="width:30%;">
                    <asp:RadioButton ID="rdProficional" runat="server" GroupName="gCadastrarUser" 
                        AutoPostBack="true" oncheckedchanged="rdProficional_CheckedChanged" />
                    <img alt="Icone Proficional" src="" />
                </td>
                <td align="left" class="details" style="width:auto;">
                    <b>Proficional</b><br />
                    (Descri&ccedil;&atilde;o)
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
