<%@ Page Title="" Language="C#" MasterPageFile="~/MenuDefault.Master" AutoEventWireup="true"
    CodeBehind="Colorir.aspx.cs" Inherits="LeComCre.Web.Colorir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
    <span style="font-family: Verdana; font-size: x-large;">Imagens para Colorir</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceColorir" runat="server" SelectMethod="getColorir"
        TypeName="LeComCre.Web.Negocios.Aplicativos"></asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterColorir" runat="server" DataSourceID="ObjectDataSourceColorir"
        OnItemCommand="RepeaterColorir_ItemCommand">
        <HeaderTemplate>
            <span class="td_dados">Selecione uma imagem:</span>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:LinkButton ID="lnkTemas" Style="font-family: Verdana, Tahoma, Arial; color: Black;
                    text-align: left; font-size: 9px;" runat="server" CommandName="View" CommandArgument='<%# Eval("Colorir_id") %>'
                    Text='<%# Eval("descricao") %>'></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">
    <div id="CorpoColorir" style="width: 100%; height: 100% auto; vertical-align: text-top;
        text-align: justify; display: none;" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td style="width: 385px;">
                    <asp:Label ID="lblTitle" runat="server" Text="" Style="font-family: Verdana; font-size: x-large;"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton ID="imgPrint" runat="server" ImageUrl="~/images/printImage.png"
                        Width="64px" Height="64px" AlternateText="Imprimir a Foto" 
                        onclick="imgPrint_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ImageButton ID="imgDownload" runat="server" OnClick="imgDownload_Click" AlternateText="Download da Foto" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
