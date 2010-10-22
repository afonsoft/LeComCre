<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="InfoAssunto.aspx.cs" Inherits="LeComCre.Web.InfoAssunto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <table border="0" width="100%" cellpadding="1" cellspacing="1">
        <tr>
            <td class="td_Titulo" style="width: 85%;">
                <asp:Label ID="lblTitle" runat="server" Text="Titulo"></asp:Label>
            </td>
            <td class="td_dados" align="right">
                <asp:Label ID="lblUser" runat="server" Text="Usuario"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td_dados" colspan="2">
                <asp:Label ID="lblDesc" runat="server" Text="Desc"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td_dados" colspan="2">
                <br />
                Comentarios:
            </td>
        </tr>
        <tr>
            <td colspan="2" class="td_dados">
                <asp:HiddenField ID="HiddenFieldAssuntoId" runat="server" />
                <asp:ObjectDataSource ID="ObjectDataSourceAssunto" runat="server" SelectMethod="getConteudoByAssuntoId"
                    TypeName="LeComCre.Web.Negocios.Assuntos">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenFieldAssuntoId" DefaultValue="0" Name="idAssunto"
                            PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Repeater ID="RepeaterComentarios" runat="server" DataSourceID="ObjectDataSourceAssunto">
                    <HeaderTemplate>
                        <table width="100%" cellpadding="3" cellspacing="3">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="td_dados" style="width: 10%;">
                                <asp:Label ID="lblUser" runat="server" Text="Usuario"></asp:Label>
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td class="td_dados" style="width: 90%;">
                                <asp:Label ID="lblComentario" runat="server" Text="Comentario"></asp:Label>
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
            <td colspan="2" class="td_dados">
                <table border="0" width="100%">
                    <tr>
                        <td class="td_dados" style="width: 15%;">
                            Comentar:
                        </td>
                        <td class="td_dados" style="width: 85%;">
                            <asp:TextBox ID="txtComentar" runat="server" Width="98%" TextMode="MultiLine" Columns="80"
                                Height="50px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            &nbsp;<asp:Button ID="btnEnviarComentario" runat="server" Text="Enviar" 
                                onclick="btnEnviarComentario_Click" />&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
