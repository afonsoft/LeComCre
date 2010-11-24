<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="LeComCre.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
    <style type="text/css">
        body
        {
            background-color: #F9f6bd;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">
    <table style="display: inline-table;" border="0" cellpadding="0" cellspacing="0" width="1024">
        <tr>
            <td>
                <img src="images/spacer.gif" width="9" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="23" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="126" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="23" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="49" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="45" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="17" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="35" height="1" border="0" alt="" />
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
                <img src="images/spacer.gif" width="10" height="1" border="0" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="14" height="1" border="0" alt="" />
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
                <img src="images/spacer.gif" width="84" height="1" border="0" alt="" />
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
            <td colspan="22">
                <img name="home_r1_c1" src="images/home_r1_c1.gif" width="1024" height="10" border="0" id="home_r1_c1"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="10" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="5">
                <a href="Default.aspx"><img name="home_r2_c1" src="images/home_r2_c1.gif" width="230" height="75" border="0" id="home_r2_c1"
                    alt="LéComCré" /></a>
            </td>
            <td colspan="6">
                <img name="home_r2_c6" src="images/home_r2_c6.gif" width="262" height="47" border="0" id="home_r2_c6"
                    alt="" />
            </td>
            <td>
               <a href="QuemSomos.aspx"> <img name="home_r2_c12" src="images/home_r2_c12.gif" width="134" height="47" border="0" id="home_r2_c12"
                    alt="Quem Somos" /></a>
            </td>
            <td colspan="4">
                <a href="acessebilidade.aspx"><img name="home_r2_c13" src="images/home_r2_c13.gif" width="150" height="47" border="0" id="home_r2_c13"
                    alt="Acessebilidade" /></a>
            </td>
            <td colspan="3">
                <a href="Cadastrar.aspx"><img name="home_r2_c17" src="images/home_r2_c17.gif" width="127" height="47" border="0" id="home_r2_c17"
                    alt="Cadastre-se" /></a>
            </td>
            <td colspan="2">
                <a href="email.aspx"><img name="home_r2_c20" src="images/home_r2_c20.gif" width="98" height="47" border="0" id="home_r2_c20"
                    alt="Contato" /></a>
            </td>
            <td rowspan="19">
                <img name="home_r2_c22" src="images/home_r2_c22.gif" width="23" height="758" border="0" id="home_r2_c22"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="47" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="6">
                <img name="home_r3_c6" src="images/home_r3_c6.gif" width="262" height="43" border="0" id="home_r3_c6"
                    alt="" />
            </td>
            <td rowspan="2" colspan="10" style="background-image: url('images/home_r3_c12.gif'); text-align: right;
                vertical-align: top;" align="right" valign="top">
                <asp:Label ID="lblUsuarioLogado" runat="server" Text="" CssClass="td_dados"></asp:Label>
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="28" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="17">
                <img name="home_r4_c1" src="images/home_r4_c1.gif" width="9" height="683" border="0" id="home_r4_c1"
                    alt="" />
            </td>
            <td colspan="4">
                <img name="home_r4_c2" src="images/home_r4_c2.gif" width="221" height="15" border="0" id="home_r4_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="15" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <img name="home_r5_c2" src="images/home_r5_c2.gif" width="172" height="21" border="0" id="home_r5_c2"
                    alt="" />
            </td>
            <td rowspan="4" colspan="4">
                <a href="Colorir.aspx"><img name="home_r5_c5" src="images/home_r5_c5.gif" width="146" height="94" border="0" id="home_r5_c5"
                    alt="Colorir" /></a>
            </td>
            <td rowspan="4">
                <img name="home_r5_c9" src="images/home_r5_c9.gif" width="51" height="94" border="0" id="home_r5_c9"
                    alt="" />
            </td>
            <td rowspan="4">
                <a href="Assuntos.aspx"><img name="home_r5_c10" src="images/home_r5_c10.gif" width="84" height="94" border="0" id="home_r5_c10"
                    alt="Forum" /></a>
            </td>
            <td rowspan="4">
                <img name="home_r5_c11" src="images/home_r5_c11.gif" width="30" height="94" border="0" id="home_r5_c11"
                    alt="" />
            </td>
            <td rowspan="4" colspan="2">
                <a href="Temas.aspx"><img name="home_r5_c12" src="images/home_r5_c12.gif" width="150" height="94" border="0" id="home_r5_c12"
                    alt="Temas Profissionais" /></a>
            </td>
            <td rowspan="4" colspan="2">
                <img name="home_r5_c14" src="images/home_r5_c14.gif" width="24" height="94" border="0" id="home_r5_c14"
                    alt="" />
            </td>
            <td rowspan="4" colspan="2">
                <a href="Chat.aspx"><img name="home_r5_c16" src="images/home_r5_c16.gif" width="142" height="94" border="0" id="home_r5_c16"
                    alt="BatePapo" /></a>
            </td>
            <td rowspan="2" colspan="4">
                <img name="home_r5_c18" src="images/home_r5_c18.gif" width="193" height="27" border="0" id="home_r5_c18"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="21" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="3">
                <img name="home_r6_c2" src="images/home_r6_c2.gif" width="23" height="73" border="0" id="home_r6_c2"
                    alt="" />
            </td>
            <td rowspan="2">
                <a href="jogos.aspx"><img name="home_r6_c3" src="images/home_r6_c3.gif" width="126" height="67" border="0" id="home_r6_c3"
                    alt="Jogos" /></a>
            </td>
            <td rowspan="3">
                <img name="home_r6_c4" src="images/home_r6_c4.gif" width="23" height="73" border="0" id="home_r6_c4"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="6" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <img name="home_r7_c18" src="images/home_r7_c18.gif" width="31" height="67" border="0" id="home_r7_c18"
                    alt="" />
            </td>
            <td rowspan="2" colspan="2">
                <a href="Anuncie.aspx"><img name="home_r7_c19" src="images/home_r7_c19.gif" width="148" height="67" border="0" id="home_r7_c19"
                    alt="Anuncie" /></a>
            </td>
            <td rowspan="2">
                <img name="home_r7_c21" src="images/home_r7_c21.gif" width="14" height="67" border="0" id="home_r7_c21"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="61" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td>
                <img name="home_r8_c3" src="images/home_r8_c3.gif" width="126" height="6" border="0" id="home_r8_c3"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="6" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="5">
                <img name="home_r9_c2" src="images/home_r9_c2.gif" width="266" height="136" border="0" id="home_r9_c2"
                    alt="" />
            </td>
            <td colspan="15">
                <img name="home_r9_c7" src="images/home_r9_c7.gif" width="726" height="47" border="0" id="home_r9_c7"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="47" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="3" colspan="8">
                <img name="home_r10_c7" src="images/home_r10_c7.gif" width="377" height="161" border="0" id="home_r10_c7"
                    alt="" />
            </td>
            <td rowspan="3" colspan="7">
                <img name="home_r10_c15" src="images/home_r10_c15.gif" width="349" height="161" border="0"
                    id="home_r10_c15" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="89" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <img name="home_r11_c2" src="images/home_r11_c2.gif" width="266" height="6" border="0" id="home_r11_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="6" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="5">
                <img name="home_r12_c2" src="images/home_r12_c2.gif" width="266" height="132" border="0" id="home_r12_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="66" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="3" colspan="8">
                <img name="home_r13_c7" src="images/home_r13_c7.gif" width="377" height="163" border="0" id="home_r13_c7"
                    alt="" />
            </td>
            <td rowspan="3" colspan="7">
                <img name="home_r13_c15" src="images/home_r13_c15.gif" width="349" height="163" border="0"
                    id="home_r13_c15" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="66" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <img name="home_r14_c2" src="images/home_r14_c2.gif" width="266" height="12" border="0" id="home_r14_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="12" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="5">
                <img name="home_r15_c2" src="images/home_r15_c2.gif" width="266" height="128" border="0" id="home_r15_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="85" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <img name="home_r16_c7" src="images/home_r16_c7.gif" width="17" height="52" border="0" id="home_r16_c7"
                    alt="" />
            </td>
            <td rowspan="3" colspan="7">
                <img name="home_r16_c8" src="images/home_r16_c8.gif" width="360" height="61" border="0" id="home_r16_c8"
                    alt="" />
            </td>
            <td rowspan="3" colspan="7">
                <img name="home_r16_c15" src="images/home_r16_c15.gif" width="349" height="61" border="0" id="home_r16_c15"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="43" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <img name="home_r17_c2" src="images/home_r17_c2.gif" width="266" height="9" border="0" id="home_r17_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="9" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" colspan="6">
                <img name="home_r18_c2" src="images/home_r18_c2.gif" width="283" height="128" border="0" id="home_r18_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="9" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <img name="home_r19_c8" src="images/home_r19_c8.gif" width="360" height="119" border="0" id="home_r19_c8"
                    alt="" />
            </td>
            <td colspan="7">
                <img name="home_r19_c15" src="images/home_r19_c15.gif" width="349" height="119" border="0"
                    id="home_r19_c15" alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="119" border="0" alt="" />
            </td>
        </tr>
        <tr>
            <td colspan="20">
                <img name="home_r20_c2" src="images/home_r20_c2.gif" width="992" height="23" border="0" id="home_r20_c2"
                    alt="" />
            </td>
            <td>
                <img src="images/spacer.gif" width="1" height="23" border="0" alt="" />
            </td>
        </tr>
    </table>
</asp:Content>
