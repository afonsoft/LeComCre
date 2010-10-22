<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="RecuperarSenha.aspx.cs"
    Inherits="LeComCre.Web.RecuperarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">

    <script language="javascript" type="text/jscript">
        jQuery(document).ready(function() {
            EndRequestHandler(this, null);
            jQuery('#<%= txtCPF.ClientID %>').mask("999.999.999-99");
        });
        jQuery('#<%= txtMail.ClientID %>').change(function() {
            ValidaMail();
        });

        function ValidaMail() {
            var email = document.getElementById('<%= txtMail.ClientID %>').value;
            document.getElementById('EmailCheck').style.display = "block";
            if (isValidEmail(email)) {
                document.getElementById('EmailCheck').src = "images/Check.png";
                document.getElementById('EmailCheck').alt = "E-Mail V&aacute;lido";
            } else {
                document.getElementById('EmailCheck').src = "images/negado.jpg";
                document.getElementById('EmailCheck').alt = "E-Mail Inv&aacute;lido.";
            }
        }

        function ValidaCPF() {

            document.getElementById('CPFCheck').style.display = "block";

            if (jQuery('#<%= txtCPF.ClientID %>').validCPF()) {
                document.getElementById('CPFCheck').src = "images/Check.png";
                document.getElementById('CPFCheck').alt = "CPF Valido";
            } else {
                document.getElementById('CPFCheck').src = "images/negado.jpg";
                document.getElementById('CPFCheck').alt = "CPF Inv&aacute;lido";
            }
        }
    </script>

    <table border="0" cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td class="td_dados" style="width: 14%;">
                E-Mail:
            </td>
            <td class="td_dados" style="width: 85%;" align="left">
                <div style="width: 100%;">
                    <asp:TextBox ID="txtMail" runat="server" MaxLength="100" Width="98%"></asp:TextBox>
                </div>
            </td>
            <td class="td_dados" style="width: 1%;">
                <img alt="E-Mail" id="EmailCheck" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
            </td>
        </tr>
        <tr>
            <td class="td_dados" style="width: 15%;">
                CPF:
            </td>
            <td class="td_dados" style="width: 85%;">
                <asp:TextBox ID="txtCPF" runat="server" MaxLength="20" Width="50%"></asp:TextBox>
            </td>
            <td class="td_dados" style="width: 1%;">
                <img alt="CPF" id="CPFCheck" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="btnEnviar" runat="server" Text="Enivar" CssClass="button" 
                    onclick="btnEnviar_Click" />
            </td>
            <td class="td_dados" style="width: 1%;">
            </td>
        </tr>
    </table>
</asp:Content>
