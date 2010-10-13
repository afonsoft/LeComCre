<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Tema.aspx.cs" Inherits="LeComCre.Web.Tema" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div id="TemaHTML" runat="server" style="width: 100%; height: auto; display: block;">
    </div>
    <div id="EditTemaHTML" runat="server" style="width: 100%; height: auto; display: block;">
        <cc1:Editor ID="Editor1" runat="server" Height="400px" InitialCleanUp="True" />
        <br />
        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
    </div>
</asp:Content>
