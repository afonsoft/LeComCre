<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false"
    CodeBehind="Chat.aspx.cs" Inherits="Afonsoft.Web.Chat._Chat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>..:: Lé Com Cré ::.. - Bate-Papo</title>
    <style type="text/css">
        .td_menu
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: White;
            text-align: left;
            font-size: 13px;
        }
        a:link
        {
            text-decoration: none;
        }
        a:visited
        {
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline overline;
        }
        .td_texto
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            font-size: 12px;
            font-weight: bold;
        }
        .td_Titulo
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            font-size: 13px;
        }
        .td_dados
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: Black;
            text-align: left;
            vertical-align: top;
            font-size: 12px;
        }
        .td_label
        {
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            color: White;
            background-color: Gray;
            text-align: left;
            vertical-align: top;
            font-size: 12px;
        }
        .button
        {
            border: 1px solid #BBBBBB;
            font-size: 11px;
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            font-weight: bold;
            color: #888888;
            width: 100px;
            background-color: #EEEEEE;
            width: 100px;
        }
        .tabela_login
        {
            visibility: visible;
            font-family: Tahoma, Verdana, Arial, Times New Roman;
            font-size: 12px;
            display: block;
            font-weight: normal;
            color: #000000;
            vertical-align: middle;
            text-align: left;
            border: thin solid #000000;
            width: 200px;
            height: 100px;
        }
        .Mensagem
        {
            font-family: Verdana, Arial;
            font-size: x-small;
            font-style: normal;
            color: Black;
        }
        .GridLinkButton
        {
            font-family: Verdana, Arial;
            font-size: x-small;
            font-style: normal;
            color: Gray;
        }
    </style>

    <script type="text/javascript" language="javascript">
        function ReplaceChars() {
            var txt = document.getElementById('txtMensagem').value;
            var out = "'"; // replace this
            var add = "`"; // with this
            var temp = "" + txt; // temporary holder

            while (temp.indexOf(out) > -1) {
                pos = temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add +
                temp.substring((pos + out.length), temp.length));
            }

            document.getElementById('txtMensagem').value = temp;
        }
        function SetScrollPosition() {
            var div = document.getElementById('divMessages');
            var r = document.getElementById('chkRolagem');
            if (r.checked)
                div.scrollTop = 100000000000;
        }

        function SetToEnd(txtMessage) {
            if (txtMessage.createTextRange) {
                var fieldRange = txtMessage.createTextRange();
                fieldRange.moveStart('character', txtMessage.value.length);
                fieldRange.collapse();
                fieldRange.select();
            }
        }
        window.setInterval(SetScrollPosition, 5000);
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" OnAsyncPostBackError="ToolkitScriptManager1_AsyncPostBackError">
    </asp:ToolkitScriptManager>
    <div id="MainChat" style="vertical-align: top; text-align: center; width: 100%;"
        runat="server">
        <table id="Corpo" width="100%" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right" valign="top" style="width: 720px; height: 500px; background-color: #FFFAF0;">
                    <div id="divMessages" style="overflow: auto; width: 100%; height: 500px; background-color: #FFFAF0;
                        text-align: left;">
                        <asp:Timer ID="TimerMensagem" runat="server" Interval="5000" OnTick="TimerMensagem_Tick" />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridMensagem" runat="server" BackColor="FloralWhite" GridLines="None"
                                    Width="100%" ShowHeader="false" AutoGenerateColumns="false" CellPadding="1" CellSpacing="2">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="220px" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Panel class="Mensagem" ID="DivPara" runat="server">
                                                    <asp:Label ID="dt" runat="server" Text='<%# String.Format("{0:dd/MM/yyyy HH:mm}", Eval("DtMensagem"))  %>'></asp:Label>&nbsp;:&nbsp;
                                                    <b>
                                                        <asp:Label ID="de" runat="server" Text='<%# Eval("De")  %>'></asp:Label></b>&nbsp;fala&nbsp;
                                                    para&nbsp;<b><asp:Label ID="para" runat="server" Text='<%# Eval("Para")  %>'></asp:Label></b>&nbsp;:
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="500px">
                                            <ItemTemplate>
                                                <asp:Panel class="Mensagem" ID="DivMensagem" runat="server">
                                                    <asp:Label ID="para" runat="server" Text='<%# Eval("HtmlMensagem")  %>'></asp:Label>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerMensagem" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
                <td align="center" style="width: 80px; height: 500px; background-color: #F0FFFF;"
                    valign="top">
                    <div style="overflow: auto; width: 100%; height: 500px; background-color: #F0FFFF;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="lstUsuarios" runat="server" BackColor="Azure" GridLines="None"
                                    Width="100%" ShowHeader="False" AutoGenerateColumns="false" OnRowCommand="lstUsuarios_RowCommand"
                                    CellPadding="2" CellSpacing="2">
                                    <Columns>
                                        <asp:BoundField DataField="UserName" Visible="false" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkSelectUser" runat="server" CommandName="Select" CssClass="GridLinkButton"
                                                    Text='<%# "•    " + Eval("UserName")  %>' CommandArgument='<%# Eval("UserName")  %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="lstUsuarios" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="height: 50px; background-color: #AFEEEE;" valign="top">
                    <table width="70%">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtMensagem" runat="server" Width="100%" onkeyup="ReplaceChars()"
                                    onfocus="SetToEnd(this)" MaxLength="100" OnClientClick="SetScrollPosition()"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="button" OnClick="btnEnviar_Click" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td align="left" style="width: 5%" class="Mensagem">
                                            Para:
                                        </td>
                                        <td align="left" style="width: 40%">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <asp:Timer ID="TimerPara" runat="server" Interval="1000" Enabled="true" OnTick="TimerPara_Tick">
                                                    </asp:Timer>
                                                    <asp:Label ID="lblReservado" runat="server" Text="Todos" CssClass="Mensagem"></asp:Label>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="right" style="width: 25%" class="Mensagem">
                                            <asp:CheckBox ID="chkReservado" Text="Reservado" runat="server" CssClass="Mensagem" />
                                        </td>
                                        <td align="right" style="width: 30%" class="Mensagem">
                                            <input id="chkRolagem" type="checkbox" checked="checked" class="Mensagem" />Rolagem
                                            Automático
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:Button ID="btnLimpar" runat="server" Text="Sair" CssClass="button" OnClick="linkSair_Click" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
