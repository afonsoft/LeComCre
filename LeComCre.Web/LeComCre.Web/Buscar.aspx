<%@ Page Title="" Language="C#" MasterPageFile="~/MasterBuscar.master" AutoEventWireup="true"
    CodeBehind="Buscar.aspx.cs" Inherits="LeComCre.Web.Buscar" %>

<%@ Register Src="UserControl/ucAssunto.ascx" TagName="ucAssunto" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuCorpo" runat="server">
    <table width="100%" border="0" cellpadding="1" cellspacing="2">
        <tr>
            <td class="td_dados">
                <asp:TextBox ID="txtBuscar" runat="server" Width="90%"></asp:TextBox><asp:Button ID="btnBuscar"
                    runat="server" Text="Buscar" CssClass="button" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="td_Titulo">
                <span>Jogos</span>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ObjectDataSource ID="ObjectDataSourceJogos" runat="server" SelectMethod="getJogosByName"
                    TypeName="LeComCre.Web.Negocios.Aplicativos">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBuscar" Name="nome" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Repeater ID="RepeaterJogos" runat="server" DataSourceID="ObjectDataSourceJogos" OnItemCommand="RepeaterJogos_ItemCommand">
                    <HeaderTemplate>
                        <table width="70%" border="0" cellpadding="0" cellspacing="0">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="td_dados">
                                <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Url") + "|" + Eval("Nome")%>' CommandName="Play"
                                    runat="server" Style="font-family: Verdana, Tahoma, Arial; color: Black; text-align: left;
                                    font-size: 9px;" Text='<%# Eval("Nome")%>'></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="td_Titulo">
                <span>Colorir</span>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ObjectDataSource ID="ObjectDataSourceColorir" runat="server" SelectMethod="getColorirByName"
                    TypeName="LeComCre.Web.Negocios.Aplicativos">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBuscar" Name="nome" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Repeater ID="RepeaterColorir" runat="server" DataSourceID="ObjectDataSourceColorir" OnItemCommand="RepeaterColorir_ItemCommand">
                    <HeaderTemplate>
                        <table width="70%" border="0" cellpadding="1" cellspacing="1">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center" valign="top" class="td_dados">
                                <asp:ImageButton ID="imgTemas" runat="server" ImageUrl='<%# "~/conteudo/Colorir/" + Eval("url") %>'
                                    CommandName="View" CommandArgument='<%# Eval("Colorir_id") %>' Width="64px" Height="64px"
                                    AlternateText='<%# Eval("descricao") %>' />
                            </td>
                            <td align="left" valign="middle" class="td_dados">
                                <asp:LinkButton ID="lnkColoir" runat="server" Text='<%# Eval("descricao") %>' CommandName="View"
                                    CommandArgument='<%# Eval("Colorir_id") %>'></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="td_Titulo">
                <span>Forum</span>
            </td>
        </tr>
        <tr>
            <td class="td_dados">
                <asp:ObjectDataSource ID="ObjectDataSourceAssunto" runat="server" SelectMethod="getAssuntoByName"
                    TypeName="LeComCre.Web.Negocios.Assuntos">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBuscar" Name="Desc" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Repeater ID="RepeaterAssunto" runat="server" DataSourceID="ObjectDataSourceAssunto">
                    <HeaderTemplate>
                        <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <uc1:ucAssunto ID="ucAssunto1" runat="server" Desc='<%# Eval("Descricao") %>' Titulo='<%# Eval("Assunto") %>'
                                    OnClick='<%# "~/InfoAssunto.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(Eval("Assunto_id").ToString()) %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
    </table>
</asp:Content>
