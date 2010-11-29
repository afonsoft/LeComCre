<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temas.aspx.cs" MasterPageFile="~/MasterTemas.Master"
    Inherits="LeComCre.Web.TemaAsp" EnableEventValidation="false" ViewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
    <style type="text/css">
        .newClass { width: 100%; height: auto; min-height: 50px; max-height: 200px; position: relative; overflow: hidden; }
        .anotherNewClass { width: 100%; height: auto; min-height: 400px; position: relative; overflow: hidden; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceTema" runat="server" SelectMethod="getAllTema" TypeName="LeComCre.Web.Negocios.Temas">
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterTema" runat="server" DataSourceID="ObjectDataSourceTema" OnItemCommand="RepeaterTema_ItemCommand">
        <HeaderTemplate>
            <span class="td_dados" style="font-size: 14px;">Selecione abaixo outro tema:</span>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:LinkButton ID="lnkTemas" Style="font-family: Verdana, Tahoma, Arial; color: Black; text-align: left;
                    font-size: 12px;" runat="server" CommandName="View" CommandArgument='<%# Eval("Tema_id") %>'
                    Text='<%# Eval("Tema") %>'></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">

    <script type="text/javascript" language="javascript">

        jQuery(document).ready(function() {

            jQuery( "#Plus" ).click(function () {
                jQuery(".newClass").switchClass("newClass", "anotherNewClass", 1000);
                jQuery(".anotherNewClass").switchClass("anotherNewClass", "newClass", 1000);
		        return false;
            });
        });

    </script>

    <div id="CorpoTema" style="width: 100%; height: 100% auto; vertical-align: text-top; text-align: justify;">
        <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td class="td_Titulo">
                    <span class="td_Titulo">Titulo:&nbsp;</span><asp:Label ID="lblTitle" runat="server" Text="" CssClass="td_Titulo"></asp:Label>
                </td>
                <td class="td_dados" align="right" style="text-align: right; width: 120px;">
                    <span class="td_dados">Data:&nbsp;</span><asp:Label ID="lblData" runat="server" Text="" CssClass="td_dados"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="TemaSelecionado" class="newClass">
                        <div style="width: 100%; font-family: Verdana;" class="td_dados" id="desc" runat="server">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <a href="#" id="Plus" class="td_dados">Veja mais...</a>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
