<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCadastro.master" AutoEventWireup="true"
    CodeBehind="CadUsuario.aspx.cs" Inherits="LeComCre.Web.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div id="DivInfoCrianca" runat="server" style="display: none;">
                    <span class="td_dados">
                        <br />
                        Voc� se identifocou como Crian�a, portanto preencha os dados ao lado.
                        <br />
                        <br />
                        Lembre-se voc� precisa de alguns dados de seus pais portanto, pe�a a ajuda deles antes de
                        come�ar a preencher. </span>
                </div>
                <div id="DivInfoProfissional" runat="server" style="display: none;">
                    <span class="td_dados">
                        <br />
                        Voc� se identifocou como profissional da �rea da educa��o portanto preencha o cadastro ao
                        lado. </span>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">

    <script type="text/jscript" language="javascript">

        jQuery(document).ready(function() {
            EndRequestHandler(this, null);
            jQuery('#<%= txtDataNascimento.ClientID %>').mask("99/99/9999");
            jQuery('#<%= txtCPFResponsavel.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtCPF.ClientID %>').mask("999.999.999-99");
            jQuery('#<%= txtTelRes.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtTelCel.ClientID %>').mask("(99) 9999-9999");
            jQuery('#<%= txtCEP.ClientID %>').mask("99999-999");

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

        ValidaMail();
        ValidaCPF();
        SenhaCheck();
        
    </script>

    <table width="450px" border="0" cellpadding="1" cellspacing="1">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">Nome:</span>
                        </td>
                        <td class="td_dados" style="width: 250px;" colspan="2">
                            <asp:TextBox ID="txtNome" runat="server" Width="90%" MaxLength="40" Text="Usuario"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">Sobrenome:</span>
                        </td>
                        <td class="td_dados" style="width: 250px;" colspan="2">
                            <asp:TextBox ID="txtSobreNome" runat="server" Width="90%" MaxLength="40" Text="Teste"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">Apelido:</span>
                        </td>
                        <td class="td_dados" style="width: 250px;" colspan="2">
                            <asp:TextBox ID="txtApelido" runat="server" Width="30%" MaxLength="10" Text="Apelido"></asp:TextBox>
                            <span style="font-family: Tahoma, Verdana; font-size: xx-small;">&nbsp;(Maximo de 10 caracteres)</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">Data de Nascimento:</span>
                        </td>
                        <td class="td_dados" style="width: 250px;" colspan="2">
                            <asp:TextBox ID="txtDataNascimento" runat="server" Width="40%" MaxLength="10" Text="28/07/1983"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">E-Mail:</span>
                        </td>
                        <td class="td_dados" style="width: 250px; white-space: nowrap; height: 22px;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtEMail" runat="server" Width="200px" MaxLength="50" Text="afonsoft@hotmail.com"></asp:TextBox>
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
                        <td style="width: 120px;" class="td_dados">
                            <span class="td_dados">Senha:</span>
                        </td>
                        <td class="td_dados" style="width: 250px; white-space: nowrap; height: 30px;">
                            <table>
                                <tr>
                                    <td>
                                        <span style="font-family: Tahoma, Verdana; font-size: xx-small;">(O usuario ser&aacute; o seu
                                            E-Mail)</span><br />
                                        <asp:TextBox ID="txtSenha" runat="server" Width="150px" TextMode="Password" MaxLength="10"
                                            Text="123123"></asp:TextBox>
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
                            <td class="td_dados" style="width: 120px;">
                                <span class="td_dados"> Nome do Pai:</span>
                            </td>
                            <td class="td_dados" style="width: 250px;">
                                <asp:TextBox ID="txtNomePai" runat="server" Width="90%" MaxLength="50" Text="Pai Usuario"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 120px;">
                                <span class="td_dados"> Nome da M&atilde;e:</span>
                            </td>
                            <td class="td_dados" style="width: 250px;">
                                <asp:TextBox ID="txtNomeMae" runat="server" Width="90%" MaxLength="50" Text="M�e Usuario"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 120px;">
                                <span class="td_dados"> E-Mails dos Pais:</span>
                            </td>
                            <td class="td_dados" style="width: 250px;">
                                <asp:TextBox ID="txtMailsPais" runat="server" Width="90%" MaxLength="50" Text="pai@usuario.com"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 120px;">
                                <span class="td_dados">  CPF do Responsavel:</span>
                            </td>
                            <td class="td_dados" style="width: 250px; white-space: nowrap; height: 20px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCPFResponsavel" runat="server" Width="150px" MaxLength="20" Text="304.237.058-57"></asp:TextBox>
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
                                            <span class="td_dados"> Dados da Escola</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <span class="td_dados">S&eacute;rie:</span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSerieEscola" runat="server" MaxLength="30" Width="100px" Text="5ADSI"></asp:TextBox>
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
                                            <span class="td_dados"> Nome:</span>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomeEscola" runat="server" Width="200px" MaxLength="50" Text="Veris"></asp:TextBox>
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
                            <td style="width: 120px;" class="td_dados">
                                <span class="td_dados"> CPF:</span>
                            </td>
                            <td class="td_dados" colspan="2" style="width: 250px; white-space: nowrap; height: 20px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCPF" runat="server" Width="150px" MaxLength="20" Text="304.237.058-57"></asp:TextBox>
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
                            <td style="width: 120px;" class="td_dados">
                                <span class="td_dados"> Telefone Res.:</span>
                            </td>
                            <td class="td_dados" colspan="4" style="width: 250px;">
                                <asp:TextBox ID="txtTelRes" runat="server" Width="55%" Text="(11) 1234-1234"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 120px;" class="td_dados">
                                <span class="td_dados">Telefone Cel.:</span>
                            </td>
                            <td class="td_dados" colspan="4" style="width: 250px;">
                                <asp:TextBox ID="txtTelCel" runat="server" Width="55%" Text="(11) 8536-8545"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 120px;" class="td_dados">
                                <span class="td_dados">Endere&ccedil;o:</span>
                            </td>
                            <td class="td_dados" colspan="4" style="width: 250px;">
                                <asp:TextBox ID="txtEndereco" runat="server" Width="90%" Text="Rua do Usuario teste"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados" style="width: 120px;">
                                <span class="td_dados">N&uacute;mero:</span>
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                <asp:TextBox ID="txtNum" runat="server" Width="90%" Text="305"></asp:TextBox>
                            </td>
                            <td class="td_dados" style="width: 100px;">
                                <span class="td_dados"> Complemento:</span>
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtComplemento" runat="server" Width="85%" Text="AP 2202"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                <span class="td_dados">Bairro:</span>
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtBairro" runat="server" Width="90%" Text="Liberdade"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                <span class="td_dados"> Cidade:</span>
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtCidade" runat="server" Width="85%" Text="S�o Paulo"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_dados">
                                <span class="td_dados"> Estado:</span>
                            </td>
                            <td class="td_dados">
                                <asp:TextBox ID="txtEstado" runat="server" Width="90%" Text="SP"></asp:TextBox>
                            </td>
                            <td class="td_dados">
                                <span class="td_dados"> CEP:</span>
                            </td>
                            <td class="td_dados" style="width: 200px;" colspan="2">
                                <asp:TextBox ID="txtCEP" runat="server" Width="85%" Text="01508-010"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div id="DivProfissional" runat="server" style="display: block;">
                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td style="width: 120px;" class="td_dados">
                                                <span class="td_dados"> Profiss&atilde;o:</span>
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
                                                            &nbsp;<asp:TextBox ID="txtOutraProfissao" runat="server" Width="100px" Style="display: none;"
                                                                Text="Analista de Sistemas"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="td_dados">
                                                <span class="td_dados">&Aacute;rea de Atua&ccedil;&atilde;o:</span>
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
