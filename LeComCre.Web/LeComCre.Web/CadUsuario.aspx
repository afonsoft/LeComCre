<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CadUsuario.aspx.cs" Inherits="LeComCre.Web.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMain" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <script type="text/jscript" language="javascript">

        jQuery(document).ready(function() {
            EndRequestHandler(this, null);
            jQuery('#<%= txtDataNascimento.ClientID %>').mask("99/99/9999");
            jQuery('#<%= txtCPFResponsavel.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtCPF.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtTelRes.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtTelCel.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtCEP.ClientID %>').mask("999999-999");

            var date = new Date();
            date.setFullYear(date.getFullYear() - 16, date.getMonth());
            jQuery('#<%= txtDataNascimento.ClientID %>').datepicker({
                dateFormat: 'dd/mm/yy',
                dayNames: ['Domingo', 'Segunda', 'Ter&ccedil;a', 'Quarta', 'Quinta', 'Sexta', 'S&aacute;bado', 'Domingo'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'S&aacute;b', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                nextText: 'Pr&oacute;ximo',
                prevText: 'Anterior',
                buttonImage: 'images/Calendario.gif',
                showOn: 'button',
                defaultDate: date,
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
            if (jQuery('#<%= txtCPF.ClientID %>').validCPF()) {
                document.getElementById('CPFCheck').src = "images/Check.png";
            } else {
                document.getElementById('CPFCheck').src = "images/negado.jpg";
            }
            if (jQuery('#<%= txtCPFResponsavel.ClientID %>').validCPF()) {
                document.getElementById('CPFCheckResp').src = "images/Check.png";
            } else {
                document.getElementById('CPFCheckResp').src = "images/negado.jpg";
            }
        }

        function ValidaMail() {
            var email = document.getElementById('<%= txtEMail.ClientID %>').value;
            if (isValidEmail(email)) {
                document.getElementById('EmailCheck').src = "images/Check.png";
            } else {
                document.getElementById('EmailCheck').src = "images/negado.jpg";
            }
        }
        function SenhaCheck() {
            var senhaLeng = document.getElementById('<%= txtSenha.ClientID %>').value.length;
            if (senhaLeng >= 6) {
                document.getElementById('SenhaCheck').src = "images/Check.png";
            } else {
                document.getElementById('SenhaCheck').src = "images/negado.jpg";
            }
        }

        function isValidEmail(emailAddress) {
            var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            return pattern.test(emailAddress);
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
                        <td class="td_dados" style="width: 450px;">
                            <asp:TextBox ID="txtNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Sobrenome:
                        </td>
                        <td class="td_dados" style="width: 450px;">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="90%" MaxLength="40"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Apelido:
                        </td>
                        <td class="td_dados" style="width: 450px;">
                            <asp:TextBox ID="txtApelido" runat="server" Width="30%" MaxLength="10"></asp:TextBox>
                            <span style="font-family: Tahoma, Verdana; font-size: xx-small;">&nbsp;(Maximo de 10
                                caracteres)</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Data de Nascimento:
                        </td>
                        <td class="td_dados" style="width: 450px;">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="30%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            E-Mail:
                        </td>
                        <td class="td_dados" style="width: 450px;">
                            <asp:TextBox ID="txtEMail" runat="server" Width="90%" MaxLength="50"></asp:TextBox>
                            <img alt="E-Mail" id="EmailCheck" src="images/negado.jpg" width="16px" height="16px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;" class="td_dados">
                            Senha:
                        </td>
                        <td class="td_dados" style="width: 450px;">
                            <span style="font-family: Tahoma, Verdana; font-size: xx-small;">(O usuario ser&aacute;
                                o seu E-Mail)</span><br />
                            <asp:TextBox ID="txtSenha" runat="server" Width="130px" TextMode="Password" MaxLength="10"></asp:TextBox>
                            <img alt="Senha" id="SenhaCheck" src="images/negado.jpg" width="16px" height="16px" />
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
                            <td class="td_dados" style="width: 450px;">
                                <asp:TextBox ID="txtCPFResponsavel" runat="server" Width="50%" MaxLength="20"></asp:TextBox>
                                <img alt="CPF" id="CPFCheckResp" src="images/negado.jpg" width="16px" height="16px" />
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
                                            <asp:RadioButton ID="rdPublica" runat="server" GroupName="gEscola" Text="Publica"
                                                Checked="True" />
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
                            <td class="td_dados" colspan="3" style="width: 450px;">
                                <asp:TextBox ID="txtCPF" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                                <img alt="CPF" id="CPFCheck" src="images/negado.jpg" width="16px" height="16px" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Res.:
                            </td>
                            <td class="td_dados" colspan="3" style="width: 450px;">
                                <asp:TextBox ID="txtTelRes" runat="server" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Telefone Cel.:
                            </td>
                            <td class="td_dados" colspan="3" style="width: 450px;">
                                <asp:TextBox ID="txtTelCel" runat="server" Width="40%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;" class="td_dados">
                                Endere&ccedil;o:
                            </td>
                            <td class="td_dados" colspan="3" style="width: 450px;">
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
                            <td class="td_dados" style="width: 200px;">
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
                            <td class="td_dados" style="width: 200px;">
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
                            <td class="td_dados" style="width: 200px;">
                                <asp:TextBox ID="txtCEP" runat="server" Width="85%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
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
                                                        <td class="td_dados">
                                                            <asp:RadioButton ID="rdPedagogo" Text="Pedagogo" runat="server" GroupName="gProfissao"
                                                                Checked="True" /><br />
                                                            <asp:RadioButton ID="rdPisicologo" Text="Pisicologo" runat="server" GroupName="gProfissao" /><br />
                                                            <asp:RadioButton ID="rdFonoaudiologo" Text="Fonoaudiologo" runat="server" GroupName="gProfissao" /><br />
                                                            <asp:RadioButton ID="rdOutros" Text="Outros" runat="server" GroupName="gProfissao" />
                                                            &nbsp;<asp:TextBox ID="txtOutraProfissao" runat="server" Width="100px"></asp:TextBox>
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
                                            <td colspan="2">
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
