<%@ Page Title="" Language="C#" MasterPageFile="~/MasterJogos.Master" AutoEventWireup="true"
    CodeBehind="jogos.aspx.cs" Inherits="LeComCre.Web.jogos" %>

<%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceJogos" runat="server" SelectMethod="getJogos" TypeName="LeComCre.Web.Negocios.Aplicativos">
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterMenuJogos" runat="server" DataSourceID="ObjectDataSourceJogos" OnItemCommand="RepeaterMenuJogos_ItemCommand">
        <HeaderTemplate>
            <div id="mainMenuJogos">
                <span class="td_dados">Selecione abaixo um de nossos jogos:</span>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <span class="td_dados"><asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Url") + "|" + Eval("Nome")%>' CommandName="Play"
                    runat="server" Text='<%# Eval("Nome")%>'></asp:LinkButton></span>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <div id="CorpoJogo" style="width: 100%; height: 100% auto; vertical-align: middle; text-align: center;">
        <table>
            <tr>
                <td colspan="2" align="left">
                    <asp:Label ID="lblTitle" runat="server" Text="" CssClass="td_Titulo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: auto; height: 450px;">
                    <asp:Label ID="lblInfo" runat="server" Text="" CssClass="td_dados"></asp:Label> 
                </td>
                <td align="right" style="width: 450px; height: 450px;">
                    <Bewise:FlashControl ID="FlashControl1" runat="server" MovieUrl="x.swf" Quality="Autohigh"
                        BrowserDetection="true" Visible="false" Scale="Exactfit" XHTMLcompliant="True" Width="400px"
                        Height="400px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
