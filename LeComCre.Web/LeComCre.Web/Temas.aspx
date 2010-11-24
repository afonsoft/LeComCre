<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temas.aspx.cs" MasterPageFile="~/MasterTemas.Master"
    Inherits="LeComCre.Web.TemaAsp" EnableEventValidation="false" ViewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceTema" runat="server" SelectMethod="getAllTema" TypeName="LeComCre.Web.Negocios.Temas">
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterTema" runat="server" DataSourceID="ObjectDataSourceTema" OnItemCommand="RepeaterTema_ItemCommand">
        <HeaderTemplate>
            <span class="td_dados">Selecione abaixo outro tema:</span>
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
    <div id="CorpoTema" style="width: 100%; height: 100% auto; vertical-align: text-top; text-align: justify;">
        <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text="" Style="font-family: Verdana; font-size: x-large;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 100%; font-family: Verdana; font-size: small;" id="desc" runat="server">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
