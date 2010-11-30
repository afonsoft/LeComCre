<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="Chat.aspx.cs"
    Inherits="Afonsoft.Web.Chat._Chat" EnableEventValidation="false" ViewStateEncryptionMode="Never" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>..:: Lé Com Cré ::.. - Bate-Papo</title>
    <style type="text/css">
        body
        {
            background-color: #FFDDFA;
            background-image: url('images/fundo.png');
        }
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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" OnAsyncPostBackError="ToolkitScriptManager1_AsyncPostBackError"
        AsyncPostBackTimeout="360">
    </asp:ToolkitScriptManager>
    <center>
        <table style="display: inline-table;" border="0" cellpadding="0" cellspacing="0" width="1024">
            <tr>
                <td>
                    <img src="images/spacer.gif" width="32" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="14" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="45" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="67" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="23" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="49" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="24" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="53" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="20" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="51" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="84" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="30" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="134" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="16" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="24" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="110" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="32" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="31" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="64" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="58" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="26" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="14" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="23" height="1" border="0" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="1" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="23">
                    <img name="bate_papo_r1_c1" src="images/bate_papo_r1_c1.gif" width="1024" height="10" border="0"
                        id="bate_papo_r1_c1" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="10" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td rowspan="2" colspan="6">
                    <a href="Default.aspx">
                        <img name="bate_papo_r2_c1" src="images/bate_papo_r2_c1.gif" width="230" height="75" border="0"
                            id="bate_papo_r2_c1" alt="LéComCré" /></a>
                </td>
                <td colspan="6">
                    <img name="bate_papo_r2_c7" src="images/bate_papo_r2_c7.gif" width="262" height="47" border="0"
                        id="bate_papo_r2_c7" alt="" />
                </td>
                <td>
                    <a href="QuemSomos.aspx">
                        <img name="bate_papo_r2_c13" src="images/bate_papo_r2_c13.gif" width="134" height="47" border="0"
                            id="bate_papo_r2_c13" alt="Quem Somos" /></a>
                </td>
                <td colspan="3">
                    <a href="acessibilidade.aspx">
                        <img name="bate_papo_r2_c14" src="images/bate_papo_r2_c14.gif" width="150" height="47" border="0"
                            id="bate_papo_r2_c14" alt="Acessebilidade" /></a>
                </td>
                <td colspan="3">
                    <a href="Cadastrar.aspx">
                        <img name="bate_papo_r2_c17" src="images/bate_papo_r2_c17.gif" width="127" height="47" border="0"
                            id="bate_papo_r2_c17" alt="Cadastre-se" /></a>
                </td>
                <td colspan="3">
                    <a href="email.aspx">
                        <img name="bate_papo_r2_c20" src="images/bate_papo_r2_c20.gif" width="98" height="47" border="0"
                            id="bate_papo_r2_c20" alt="Contato" /></a>
                </td>
                <td rowspan="11">
                    <img name="bate_papo_r2_c23" src="images/bate_papo_r2_c23.gif" width="23" height="758" border="0"
                        id="bate_papo_r2_c23" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="47" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td rowspan="2" colspan="6">
                    <img name="bate_papo_r3_c7" src="images/bate_papo_r3_c7.gif" width="262" height="43" border="0"
                        id="bate_papo_r3_c7" alt="" />
                </td>
                <td rowspan="2" colspan="10">
                    <img name="bate_papo_r3_c13" src="images/bate_papo_r3_c13.gif" width="509" height="43" border="0"
                        id="bate_papo_r3_c13" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="28" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <img name="bate_papo_r4_c1" src="images/bate_papo_r4_c1.gif" width="230" height="15" border="0"
                        id="bate_papo_r4_c1" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="15" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <img name="bate_papo_r5_c1" src="images/bate_papo_r5_c1.gif" width="181" height="21" border="0"
                        id="bate_papo_r5_c1" alt="" />
                </td>
                <td rowspan="4" colspan="4">
                    <a href="Colorir.aspx">
                        <img name="bate_papo_r5_c6" src="images/bate_papo_r5_c6.gif" width="146" height="94" border="0"
                            id="bate_papo_r5_c6" alt="Colorir" /></a>
                </td>
                <td rowspan="4">
                    <img name="bate_papo_r5_c10" src="images/bate_papo_r5_c10.gif" width="51" height="94" border="0"
                        id="bate_papo_r5_c10" alt="" />
                </td>
                <td rowspan="4">
                    <a href="Assuntos.aspx">
                        <img name="bate_papo_r5_c11" src="images/bate_papo_r5_c11.gif" width="84" height="94" border="0"
                            id="bate_papo_r5_c11" alt="Forum" /></a>
                </td>
                <td rowspan="4">
                    <img name="bate_papo_r5_c12" src="images/bate_papo_r5_c12.gif" width="30" height="94" border="0"
                        id="bate_papo_r5_c12" alt="" />
                </td>
                <td rowspan="4" colspan="2">
                    <a href="Temas.aspx">
                        <img name="bate_papo_r5_c13" src="images/bate_papo_r5_c13.gif" width="150" height="94" border="0"
                            id="bate_papo_r5_c13" alt="Profissionais" /></a>
                </td>
                <td rowspan="4">
                    <img name="bate_papo_r5_c15" src="images/bate_papo_r5_c15.gif" width="24" height="94" border="0"
                        id="bate_papo_r5_c15" alt="" />
                </td>
                <td rowspan="4" colspan="2">
                    <a href="Chat.aspx">
                        <img name="bate_papo_r5_c16" src="images/bate_papo_r5_c16.gif" width="142" height="94" border="0"
                            id="bate_papo_r5_c16" alt="BatePapo" /></a>
                </td>
                <td rowspan="2" colspan="5">
                    <img name="bate_papo_r5_c18" src="images/bate_papo_r5_c18.gif" width="193" height="27" border="0"
                        id="bate_papo_r5_c18" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="21" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <img name="bate_papo_r6_c1" src="images/bate_papo_r6_c1.gif" width="32" height="73" border="0"
                        id="bate_papo_r6_c1" alt="" />
                </td>
                <td rowspan="2" colspan="3">
                    <a href="jogos.aspx">
                        <img name="bate_papo_r6_c2" src="images/bate_papo_r6_c2.gif" width="126" height="67" border="0"
                            id="bate_papo_r6_c2" alt="Jogos" /></a>
                </td>
                <td rowspan="3">
                    <img name="bate_papo_r6_c5" src="images/bate_papo_r6_c5.gif" width="23" height="73" border="0"
                        id="bate_papo_r6_c5" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="6" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    <img name="bate_papo_r7_c18" src="images/bate_papo_r7_c18.gif" width="31" height="67" border="0"
                        id="bate_papo_r7_c18" alt="" />
                </td>
                <td rowspan="2" colspan="3">
                    <a href="email.aspx">
                        <img name="bate_papo_r7_c19" src="images/bate_papo_r7_c19.gif" width="148" height="67" border="0"
                            id="bate_papo_r7_c19" alt="Anuncie" /></a>
                </td>
                <td rowspan="2">
                    <img name="bate_papo_r7_c22" src="images/bate_papo_r7_c22.gif" width="14" height="67" border="0"
                        id="bate_papo_r7_c22" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="61" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <img name="bate_papo_r8_c2" src="images/bate_papo_r8_c2.gif" width="126" height="6" border="0"
                        id="bate_papo_r8_c2" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="6" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <img name="bate_papo_r9_c1" src="images/bate_papo_r9_c1.gif" width="91" height="83" border="0"
                        id="bate_papo_r9_c1" alt="" />
                </td>
                <td colspan="4">
                    <img name="bate_papo_r9_c4" src="images/bate_papo_r9_c4.gif" width="163" height="83" border="0"
                        id="bate_papo_r9_c4" alt="" />
                </td>
                <td>
                    <img name="bate_papo_r9_c8" src="images/bate_papo_r9_c8.gif" width="53" height="83" border="0"
                        id="bate_papo_r9_c8" alt="" />
                </td>
                <td colspan="4">
                    <img name="bate_papo_r9_c9" src="images/bate_papo_r9_c9.gif" width="185" height="83" border="0"
                        id="bate_papo_r9_c9" alt="" />
                </td>
                <td colspan="5">
                    <img name="bate_papo_r9_c13" src="images/bate_papo_r9_c13.gif" width="316" height="83" border="0"
                        id="bate_papo_r9_c13" alt="" />
                </td>
                <td colspan="3">
                    <img name="bate_papo_r9_c18" src="images/bate_papo_r9_c18.gif" width="153" height="83" border="0"
                        id="bate_papo_r9_c18" alt="" />
                </td>
                <td colspan="2">
                    <img name="bate_papo_r9_c21" src="images/bate_papo_r9_c21.gif" width="40" height="83" border="0"
                        id="bate_papo_r9_c21" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="83" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-image: url('images/bate_papo_r10_c1.gif'); background-repeat: repeat-y;
                    height: auto;">
                    <img name="bate_papo_r10_c1" src="images/bate_papo_r10_c1.gif" width="46" height="201" border="0"
                        id="bate_papo_r10_c1" alt="" />
                </td>
                <td rowspan="2" colspan="18" style="background-color: White; text-align: justify; vertical-align: top;"
                    align="justify" valign="top">
                    <div id="MainChat" style="vertical-align: top; text-align: center; width: 100%;" runat="server">
                        <table id="Corpo" width="100%" border="1px" cellpadding="1" cellspacing="1" style="border-color: #FFDDFA;
                            border-style: solid; border-width: thin;">
                            <tr>
                                <td align="right" valign="top" style="width: 800px; height: 380px; background-color: #FFFFFF;">
                                    <div id="divMessages" style="overflow: auto; width: 100%; height: 100%; background-color: #FFFFFF;
                                        text-align: left; border-color: #FFDDFA; border-style: solid; border-width: thin;">
                                        <asp:Timer ID="TimerMensagem" runat="server" Interval="5000" OnTick="TimerMensagem_Tick" />
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="GridMensagem" runat="server" BackColor="#FFFFFF" GridLines="None" Width="100%"
                                                    ShowHeader="false" AutoGenerateColumns="false" CellPadding="1" CellSpacing="2">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Left">
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
                                <td align="center" style="width: 100px; height: 380px; background-color: #FFFFFF;" valign="top">
                                    <div style="overflow: auto; width: 100%; height: 100%; background-color: #FFFFFF; border-color: #FFDDFA;
                                        border-style: solid; border-width: thin;" id="DivUsuarios">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="lstUsuarios" runat="server" BackColor="#FFFFFF" GridLines="None" Width="100%"
                                                    ShowHeader="true" AutoGenerateColumns="false" OnRowCommand="lstUsuarios_RowCommand" CellPadding="2"
                                                    CellSpacing="2">
                                                    <Columns>
                                                        <asp:BoundField DataField="UserName" Visible="false" />
                                                        <asp:TemplateField>
                                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                                            <HeaderStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#FFDDFA" />
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkSelectUser" runat="server" CommandName="Select" CssClass="GridLinkButton"
                                                                    Text='<%# "•    " + Eval("UserName")  %>' CommandArgument='<%# Eval("UserName") + "|" + Eval("Usuario_id")  %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                <span style="background-color: #FFDDFA; font-family:Tahoma; font-size:x-small;">Úsuarios On-Line</span>
                                                            </HeaderTemplate>
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
                                <td colspan="2" align="center" style="height: 35px; background-color: #FFDDFA;" valign="top"
                                    id="tdSend">
                                    <table width="70%">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtMensagem" runat="server" Width="100%" onkeyup="ReplaceChars()" onfocus="SetToEnd(this)"
                                                    MaxLength="100" OnClientClick="SetScrollPosition()"></asp:TextBox>
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
                                                        <td align="left" style="width: 30%">
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
                                                        <td align="right" style="width: 40%" class="Mensagem">
                                                            <input id="chkRolagem" type="checkbox" checked="checked" class="Mensagem" />Rolagem Automático
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
                    <%--<img name="bate_papo_r10_c3" src="images/bate_papo_r10_c3.gif" width="915" height="441" border="0"
                        id="bate_papo_r10_c3" alt="" />--%>
                </td>
                <td colspan="2" style="background-image: url('images/bate_papo_r10_c21.gif'); background-repeat: repeat-y;
                    height: auto;">
                    <img name="bate_papo_r10_c21" src="images/bate_papo_r10_c21.gif" width="40" height="201" border="0"
                        id="bate_papo_r10_c21" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="201" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-image: url('images/bate_papo_r11_c1.gif'); background-repeat: repeat-y;
                    height: auto;">
                    <img name="bate_papo_r11_c1" src="images/bate_papo_r11_c1.gif" width="46" height="240" border="0"
                        id="bate_papo_r11_c1" alt="" />
                </td>
                <td colspan="2" style="background-image: url('images/bate_papo_r11_c21.gif'); background-repeat: repeat-y;
                    height: auto;">
                    <img name="bate_papo_r11_c21" src="images/bate_papo_r11_c21.gif" width="40" height="240" border="0"
                        id="bate_papo_r11_c21" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="240" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <img name="bate_papo_r12_c1" src="images/bate_papo_r12_c1.gif" width="46" height="50" border="0"
                        id="bate_papo_r12_c1" alt="" />
                </td>
                <td colspan="5">
                    <img name="bate_papo_r12_c3" src="images/bate_papo_r12_c3.gif" width="208" height="50" border="0"
                        id="bate_papo_r12_c3" alt="" />
                </td>
                <td colspan="5">
                    <img name="bate_papo_r12_c8" src="images/bate_papo_r12_c8.gif" width="238" height="50" border="0"
                        id="bate_papo_r12_c8" alt="" />
                </td>
                <td colspan="5">
                    <img name="bate_papo_r12_c13" src="images/bate_papo_r12_c13.gif" width="316" height="50" border="0"
                        id="bate_papo_r12_c13" alt="" />
                </td>
                <td colspan="3">
                    <img name="bate_papo_r12_c18" src="images/bate_papo_r12_c18.gif" width="153" height="50" border="0"
                        id="bate_papo_r12_c18" alt="" />
                </td>
                <td colspan="2">
                    <img name="bate_papo_r12_c21" src="images/bate_papo_r12_c21.gif" width="40" height="50" border="0"
                        id="bate_papo_r12_c21" alt="" />
                </td>
                <td>
                    <img src="images/spacer.gif" width="1" height="50" border="0" alt="" />
                </td>
            </tr>
        </table>
    </center>
    </form>
</body>
</html>
