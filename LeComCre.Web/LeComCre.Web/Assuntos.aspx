<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"
    CodeBehind="Assuntos.aspx.cs" Inherits="LeComCre.Web.Assuntos" %>

<%@ Register Src="UserControl/ucAssunto.ascx" TagName="ucAssunto" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="3">
        <tr>
            <td>
                <table width="400px">
                    <tr>
                        <td class="td_dados" align="right" style="width: 50px;">
                            Assunto:
                        </td>
                        <td class="td_dados" align="center" style="width: 250px;">
                            <asp:TextBox ID="txtAssunto" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td class="td_dados" align="left" style="width: 100px;">
                            <asp:Button ID="btnBuscarAssunto" runat="server" Text="Buscar" CssClass="button"
                                OnClick="btnBuscarAssunto_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ObjectDataSourceAssunto" runat="server" SelectMethod="getAssuntoByName"
                    TypeName="LeComCre.Web.Negocios.Assuntos">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtAssunto" Name="Desc" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Repeater ID="RepeaterAssunto" runat="server" DataSourceID="ObjectDataSourceAssunto">
                    <HeaderTemplate>
                        <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <uc1:ucAssunto ID="ucAssunto1" runat="server" Desc='<%# Eval("Descricao") %>' Titulo='<%# Eval("Assunto") %>' OnClick='<%# Afonsoft.Libary.Cryptographic.Encryption.Criptografar(Eval("Assunto_id").ToString()) %>' />
                             </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <tr>
                            <td class="td_dados">
                            </td>
                        </tr>
                        </table></FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td class="td_dados" align="right">
                <a href="NovoAssunto.aspx">Novo Assunto para Discuss&atilde;o</a>
            </td>
        </tr>
    </table>
</asp:Content>
