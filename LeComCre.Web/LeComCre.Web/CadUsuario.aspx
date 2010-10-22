<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="CadUsuario.aspx.cs"
    Inherits="LeComCre.Web.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">

    <script type="text/jscript" language="javascript">

        jQuery(document).ready(function() {
            EndRequestHandler(this, null);
            jQuery('#<%= txtDataNascimento.ClientID %>').mask("99/99/9999");
            jQuery('#<%= txtCPFResponsavel.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtCPF.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtTelRes.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtTelCel.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtCEP.ClientID %>').mask("999999-999");

            //var date = new Date();
            //date.setFullYear(date.getFullYear() - 1, date.getMonth());
            jQuery('#<%= txtDataNascimento.ClientID %>').datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: "-1D",
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
                //defaultDate: date,
                buttonImageOnly: true
            });

            jQuery('#<%= txtEMail.ClientID %>').change(function() {
                ValidaMail();
            });

            jQuery('#<%= txtCPF.ClientID %>').change(function() {
                ValidaCPF();
            });

            jQuery('#<%= txtCPFResponsavel.ClientID %>').change(function() {
                ValidaCPF();
            });
            jQuery('#<%= txtSenha.ClientID %>').change(function() {
                SenhaCheck();
            });
        });

        function ValidaCPF() {

            document.getElementById('CPFCheck').style.display = "block";
            document.getElementById('CPFCheckResp').style.display = "block";

            if (jQuery('#<%= txtCPF.ClientID %>').validCPF()) {
                document.getElementById('CPFCheck').src = "images/Check.png";
                document.getElementById('CPFCheck').alt = "CPF Valido";
            } else {
                document.getElementById('CPFCheck').src = "images/negado.jpg";
                document.getElementById('CPFCheck').alt = "CPF Inv&aacute;lido";
            }
            if (jQuery('#<%= txtCPFResponsavel.ClientID %>').validCPF()) {
                document.getElementById('CPFCheckResp').src = "images/Check.png";
                document.getElementById('CPFCheckResp').alt = "CPF Valido";
            } else {
                document.getElementById('CPFCheckResp').src = "images/negado.jpg";
                document.getElementById('CPFCheckResp').alt = "CPF Inv&aacute;lido";
            }
        }

        function ValidaMail() {
            var email = document.getElementById('<%= txtEMail.ClientID %>').value;
            document.getElementById('EmailCheck').style.display = "block";
            if (isValidEmail(email)) {
                document.getElementById('EmailCheck').src = "images/Check.png";
                document.getElementById('EmailCheck').alt = "E-Mail V&aacute;lido";
            } else {
                document.getElementById('EmailCheck').src = "images/negado.jpg";
                document.getElementById('EmailCheck').alt = "E-Mail Inv&aacute;lido.";
            }
        }
        function SenhaCheck() {
            var senhaLeng = document.getElementById('<%= txtSenha.ClientID %>').value.length;
            document.getElementById('SenhaCheck').style.display = "block";
            if (senhaLeng >= 6) {
                document.getElementById('SenhaCheck').src = "images/Check.png";
                document.getElementById('SenhaCheck').alt = "Senha V&aacute;lido.";
            } else {
                document.getElementById('SenhaCheck').src = "images/negado.jpg";
                document.getElementById('SenhaCheck').alt = "Senha Inv&aacute;lido.";
            }
        }

        function RadionCheck(e) {
            try {
                var chk = document.getElementById('<%= rdOutros.ClientID %>');
                var txtOutros = document.getElementById('<%= txtOutraProfissao.ClientID %>');
                txtOutros.value = '';
                if (chk.checked)
                    txtOutros.style.display = "block";
                else
                    txtOutros.style.display = "none";
            } catch (r) { alert(r) }
        }
        
    </script>

    <table width="600px" border="0" cellpadding="1" cellspacing="1">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Nome:
                        </td>
                        <td class="td_dados" style="width: 450px;" colspan="2">
                            <asp:TextBox ID="txtNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Sobrenome:
                        </td>
                        <td class="td_dados" style="width: 450px;" colspan="2">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Apelido:
                        </td>
                        <td class="td_dados" style="width: 450px;" colspan="2">
                            <asp:TextBox ID="txtApelido" runat="server" Width="30%" MaxLength="10"></asp:TextBox>
                            <span style="font-family: Tahoma, Verdana; font-size: xx-small;">&nbsp;(Maximo de 10 caracteres)</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Data de Nascimento:
                        </td>
                        <td class="td_dados" style="width: 450px;" colspan="2">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="30%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            E-Mail:
                        </td>
                        <td class="td_dados" style="width: 250px; white-space: nowrap; height: 22px;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtEMail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                                    </td>
                                    <td>
                                        <img alt="E-Mail" id="EmailCheck" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 200px;" align="left">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Senha:
                        </td>
                        <td class="td_dados" style="width: 250px; white-space: nowrap; height: 30px;">
                            <table>
                                <tr>
                                    <td>
                                        <span style="font-family: Tahoma, Verdana; font-size: xx-small;">(O usuario ser&aacute; o seu
                                            E-Mail)</span><br />
                                        <asp:TextBox ID="txtSenha" runat="server" Width="130px" TextMode="Password" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td>
                                        <img alt="Senha" id="SenhaCheck" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 200px" align="left">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivCrianca" runat="server" style="display: block;">
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                Nome do Pai:
                            </td>
                            <td class="td_dados" style="width: 450px;">
                                <asp:TextBox ID="txtNomePai" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                Nome da M&atilde;e:
                            </td>
                            <td class="td_dados" style="width: 450px;">
                                <asp:TextBox ID="txtNomeMae" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                E-Mails dos Pais:
                            </td>
                            <td class="td_dados" style="width: 450px;">
                                <asp:TextBox ID="txtMailsPais" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                CPF do Responsavel:
                            </td>
                            <td class="td_dados" style="width: 250px; white-space: nowrap; height: 20px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCPFResponsavel" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                                        </td>
                                        <td>
                                            <img alt="CPF" id="CPFCheckResp" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" colspan="2" style="width: auto;">
                                <table border="0" width="100%">
                                    <tr>
                                        <td colspan="2">
                                            Dados da Escola
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            S&eacute;rie:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSerieEscola" runat="server" MaxLength="30" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:RadioButton ID="rdPublica" runat="server" GroupName="gEscola" Text="Publica" Checked="True" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdPrivada" runat="server" GroupName="gEscola" Text="Privada" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            Nome:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomeEscola" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivAdulto" runat="server" style="display: block;">
                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                CPF:
                            </td>
                            <td class="td_dados" colspan="2" style="width: 250px; white-space: nowrap; height: 20px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCPF" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                                        </td>
                                        <td>
                                            <img alt="CPF" id="CPFCheck" src="images/negado.jpg" width="16px" height="16px" style="display: none;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 200px;" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Res.:
                            </td>
                            <td class="td_dados" colspan="4" style="width: 450px;">
                                <asp:TextBox ID="txtTelRes" runat="server" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Cel.:
                            </td>
                            <td class="td_dados" colspan="4" style="width: 450px;">
                                <asp:TextBox ID="txtTelCel" runat="server" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Endere&ccedil;o:
                            </td>
                            <td class="td_dados" colspan="4" style="width: 450px;">
                                <asp:TextBox ID="txtEndereco" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 150px;">
                                N&uacute;mero:
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                <asp:TextBox ID="txtNum" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                Complemento:
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtComplemento" runat="server" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                Bairro:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtBairro" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                Cidade:
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtCidade" runat="server" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                Estado:
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtEstado" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                CEP:
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtCEP" runat="server" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div id="DivProficional" runat="server" style="display: block;">
                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td style="width: 150px;" class="td_dados">
                                                Profiss&atilde;o:
                                            </td>
                                            <td class="td_dados">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_dados" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td style="width: 50px;" class="td_dados">
                                                        </td>
                                                        <td class="td_dados" style="white-space: nowrap;">
                                                            <asp:RadioButton ID="rdPedagogo" Text="Pedagogo" runat="server" GroupName="gProfissao" Checked="True" /><br />
                                                            <asp:RadioButton ID="rdPisicologo" Text="Pisicologo" runat="server" GroupName="gProfissao"
                                                                onclick="RadionCheck(this);" /><br />
                                                            <asp:RadioButton ID="rdFonoaudiologo" Text="Fonoaudiologo" runat="server" GroupName="gProfissao"
                                                                onclick="RadionCheck(this);" /><br />
                                                            <asp:RadioButton ID="rdOutros" Text="Outros" runat="server" GroupName="gProfissao" onclick="RadionCheck(this);" />
                                                            &nbsp;<asp:TextBox ID="txtOutraProfissao" runat="server" Width="100px" Style="display: none;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 150px;" class="td_dados">
                                                &Aacute;rea de Atua&ccedil;&atilde;o:
                                            </td>
                                            <td class="td_dados">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="left">
                                                <table>
                                                    <tr>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoPublica" Text="Publica" runat="server" GroupName="gAreAtuacao"
                                                                Checked="True" />
                                                        </td>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoPrivada" Text="Privada" runat="server" GroupName="gAreAtuacao" />
                                                        </td>
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdAtuacaoNenhuma" Text="Nenhuma" runat="server" GroupName="gAreAtuacao" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button" OnClick="btnSalvar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
