<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Tema.aspx.cs" Inherits="LeComCre.Web.Tema" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div id="TemaHTML" runat="server" style="width: 100%; height: auto; display: block;">
        <table width="100%" border="0">
            <tr>
                <td class="td_Titulo">
                    <asp:Label ID="lblTitulo" runat="server" Text="Titulo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    <div id="TextoHTML" runat="server" style="width: 100%; height: auto;">
                        Texto
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="EditTemaHTML" runat="server" style="width: 100%; height: auto; display: block;">
        <table width="100%" border="0">
            <tr>
                <td class="td_dados">
                    Titulo:
                    <br />
                    <asp:TextBox ID="txtTitulo" runat="server" MaxLength="40" Width="70%">Titulo</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    Descri&ccedil;&atilde;o:<br />
                    <asp:TextBox ID="txtDescricao" runat="server" MaxLength="200" Width="98%">Titulo</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    <br />
                    <cc1:Editor ID="Editor1" runat="server" Height="400px" InitialCleanUp="True" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
    </div>
</asp:Content>
