<%@ Page Title="" Language="C#" MasterPageFile="~/MenuDefault.Master" AutoEventWireup="true"
    CodeBehind="jogos.aspx.cs" Inherits="LeComCre.Web.jogos" %>

<%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
    <span style="font-family: Verdana; font-size: x-large;">Jogos</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceJogos" runat="server" SelectMethod="getJogos" TypeName="LeComCre.Web.Negocios.Aplicativos">
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterMenuJogos" runat="server" DataSourceID="ObjectDataSourceJogos" OnItemCommand="RepeaterMenuJogos_ItemCommand">
        <HeaderTemplate>
            <div id="mainMenuJogos">
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li style="font-family: Verdana, Tahoma, Arial; color: Black; text-align: left; font-size: 10px;">
                <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Url")%>' CommandName="Play" runat="server"
                    Text='<%# Eval("Nome")%>'></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <div id="CorpoJogo" style="width: 100%; height: 100% auto;">
        <Bewise:FlashControl ID="FlashControl1" runat="server" MovieUrl="x.swf" Quality="Autohigh"
            BrowserDetection="true" Visible="false" Scale="Exactfit" XHTMLcompliant="True" />
    </div>
</asp:Content>
