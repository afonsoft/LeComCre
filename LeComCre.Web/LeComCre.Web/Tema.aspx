<%@ Page Title="" Language="C#" MasterPageFile="~/MasterTemas.Master" AutoEventWireup="true"
    CodeBehind="Tema.aspx.cs" Inherits="LeComCre.Web.Tema" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">

    <script type="text/jscript" language="javascript">

        jQuery(document).ready(function() {
            EndRequestHandler(this, null);
            jQuery('#<%= txtDataEvento.ClientID %>').mask("99/99/9999");

            jQuery('#<%= txtDataEvento.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                dayNames: ['Domingo', 'Segunda', 'Ter&ccedil;a', 'Quarta', 'Quinta', 'Sexta', 'S&aacute;bado', 'Domingo'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                nextText: 'Pr&oacute;ximo',
                prevText: 'Anterior',
                buttonImage: 'images/Calendario.png',
                showOn: 'button',
                buttonImageOnly: true
            });
        });   
    </script>

    <div id="TemaHTML" runat="server" style="width: 100%; height: auto; display: none;">
        <table width="100%" border="0">
            <tr>
                <td class="td_Titulo">
                    <span class="td_Titulo">Titulo:&nbsp;</span><asp:Label ID="lblTitulo" runat="server" Text="Titulo"></asp:Label>
                </td>
                <td class="td_dados" align="right" style="text-align: right; width: 120px;">
                    <span class="td_dados">Data:&nbsp;</span><asp:Label ID="lblData" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="td_dados" colspan="2">
                    <div id="TextoHTML" runat="server" style="width: 100%; height: auto;">
                        Texto
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="EditTemaHTML" runat="server" style="width: 100%; height: auto; display: block;">
        <table width="100%" border="0">
            <tr>
                <td class="td_dados">
                    Titulo:
                    <br />
                    <asp:TextBox ID="txtTitulo" runat="server" MaxLength="40" Width="70%">Titulo</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    Descri&ccedil;&atilde;o:<br />
                    <asp:TextBox ID="txtDescricao" runat="server" MaxLength="200" Width="98%">Titulo</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    Data do Evento:<br />
                    <asp:TextBox ID="txtDataEvento" runat="server" MaxLength="10" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_dados">
                    <br />
                    <cc1:Editor ID="Editor1" runat="server" Height="400px" InitialCleanUp="True" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
    </div>
</asp:Content>
