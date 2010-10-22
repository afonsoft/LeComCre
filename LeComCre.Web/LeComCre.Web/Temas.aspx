<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temas.aspx.cs" MasterPageFile="~/Portal.Master"
    Inherits="LeComCre.Web.TemaAsp" %>

<%@ Register Src="UserControl/ucTemaSimples.ascx" TagName="ucTemaSimples" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceTema" runat="server" SelectMethod="getAllTema"
        TypeName="LeComCre.Web.Negocios.Temas"></asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterTema" runat="server" DataSourceID="ObjectDataSourceTema">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="1" cellspacing="1">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <uc1:ucTemaSimples ID="ucTemaSimples1" runat="server" 
                        idTema='<%# Eval("Tema_id") %>'
                        Desc='<%# Eval("Descricao") %>'
                        Title='<%# Eval("Tema") %>'
                        LinkDetalhe='<%# "~/Tema.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(Eval("Tema_id") + "|0") %>'
                    />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
    <br />
    <br />
</asp:Content>
