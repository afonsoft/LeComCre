<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temas.aspx.cs" MasterPageFile="~/MenuDefault.Master"
    Inherits="LeComCre.Web.TemaAsp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceTema" runat="server" SelectMethod="getAllTema" TypeName="LeComCre.Web.Negocios.Temas">
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterTema" runat="server" DataSourceID="ObjectDataSourceTema">
        <HeaderTemplate>
            <span class="td_dados">Selecione um tema abaixo:</span>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:LinkButton ID="lnkTemas" Style="font-family: Verdana, Tahoma, Arial; color: Black; text-align: left;
                    font-size: 9px;" runat="server" CommandName="View" CommandArgument='<%# Eval("Tema_id") %>'
                    Text='<%# Eval("Tema") %>'></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
</asp:Content>
