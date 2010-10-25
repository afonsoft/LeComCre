<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"
    Inherits="LeComCre.Web.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function() {
            EndRequest(this, null);
        });

        function EndRequest(sender, arg) {
            EndRequestHandler(sender, arg);
            jQuery("#tabs").tabs({ collapsible: true }).find(".ui-tabs-nav").sortable({ axis: 'x' });
            jQuery("#accordion").accordion({ autoHeight: false, navigation: true });

            jQuery('#<%= txtUsuarioDe.ClientID %>, #<%= txtUsuarioAte.ClientID %>').datepicker({
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
                buttonImageOnly: true
            });

        }

        function OpenInfoUser() {
            jQuery(document).ready(function() {
                EndRequest(this, null);
                jQuery('#dialogInfoUsuario').dialog({
                    autoOpen: false, bgiframe: false, hide: 'slide', resizable: true, draggable: true,
                    modal: true, show: 'slide', width: 320, height: 380, minHeight: 180, minWidth: 240,
                    maxHeight: 480, maxWidth: 640, closeOnEscape: true,
                    title: "Informa&ccedil;&otilde;es do Usu&aacute;rio"
                });
                jQuery('#dialogInfoUsuario').dialog('open');
            });
        }

        if (typeof (Sys) !== 'undefined') {
            try {
                var PageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
                if (PageRequestManager != null)
                    PageRequestManager.add_endRequest(EndRequest);
            } catch (e) { }
        }   
    </script>

    <div id="tabs" style="width: 100%;" class="td_dados">
        <ul>
            <li><a href="#Usuarios">Usuarios</a></li>
            <li><a href="#Assuntos">Assuntos</a></li>
            <li><a href="#Temas">Temas</a></li>
            <li><a href="#Jogos">Jogos</a></li>
            <li><a href="#Historico">Historico Log</a></li>
        </ul>
        <div id="Usuarios" style="width: 100%;" class="td_dados">
            <b>Usuarios Aguardando Aprova&ccedil;&atilde;o</b><br />
            <asp:UpdatePanel ID="UpdatePanelUsuarios" runat="server">
                <ContentTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSourceUsuario" runat="server" SelectMethod="getUsuariosInativos"
                        TypeName="LeComCre.Web.Negocios.NegUsuario"></asp:ObjectDataSource>
                    <asp:GridView ID="GridViewUsuario" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                        BackColor="LightGoldenrodYellow" DataKeyNames="Usuario_id" BorderColor="Tan" BorderWidth="1px"
                        CellPadding="2" ForeColor="Black" GridLines="None" DataSourceID="ObjectDataSourceUsuario"
                        OnRowCommand="GridViewUsuario_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" SortExpression="Usuario_id"
                                Visible="False" />
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                            <asp:BoundField DataField="SobreNome" HeaderText="Sobre Nome" SortExpression="SobreNome" />
                            <asp:BoundField DataField="Apelido" HeaderText="Apelido" SortExpression="Apelido" />
                            <asp:TemplateField HeaderText="Op&ccedil;&otilde;es">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgView" runat="server" AlternateText="Visualizar Detalhe do Usuario"
                                        CommandArgument='<%# Eval("Usuario_id") %>' CommandName="Select" ImageUrl="~/images/View_text.png"
                                        Width="22px" Height="22px" />
                                    <asp:ImageButton ID="imgAprov" runat="server" AlternateText="Aprovar o Usuario" CommandArgument='<%# Eval("Usuario_id") %>'
                                        OnClientClick="javascript:return confirm('Deseja aprovar este usu&aacute;rio?');" CommandName="Aprov"
                                        ImageUrl="~/images/Apov_user.png" Width="22px" Height="22px" />
                                </ItemTemplate>
                                <HeaderStyle Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                    <br />
                    <asp:ObjectDataSource ID="ObjectDataSourceInfoUsuario" runat="server" SelectMethod="getUsuarioById"
                        TypeName="LeComCre.Web.Negocios.NegUsuario">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewUsuario" Name="idUsuario" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div id="dialogInfoUsuario" title="Aviso" style="display: none; font-size: x-small; color: Black;
                        font-family: Verdana; font-style: normal; font-weight: normal;" class="ui-dialog ui-resizable-handle">
                        <dl>
                            <dt><b><span style="font-size: 11px; font-weight: bold;">Informa&ccedil;&otilde;es</span></b></dt>
                            <dd id="pAlert">
                                <asp:DetailsView ID="DetailsViewInfoUsuario" runat="server" AutoGenerateRows="False" CellPadding="4"
                                    DataSourceID="ObjectDataSourceInfoUsuario" ForeColor="#333333" GridLines="None">
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <Fields>
                                        <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" SortExpression="Usuario_id" />
                                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                        <asp:BoundField DataField="SobreNome" HeaderText="Sobre Nome" SortExpression="SobreNome" />
                                        <asp:BoundField DataField="Apelido" HeaderText="Apelido" SortExpression="Apelido" />
                                        <asp:BoundField DataField="DtNascimento" HeaderText="Nascimento" SortExpression="DtNascimento" />
                                        <asp:BoundField DataField="EMail" HeaderText="Mail" SortExpression="EMail" />
                                        <asp:BoundField DataField="DtAlteracao" HeaderText="Altera&ccedil;&atilde;o" SortExpression="DtAlteracao" />
                                        <asp:TemplateField HeaderText="Tipo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tipo_Usuario.Descricao").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CPF">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Pai.CPF") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pai">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Pai") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mãe">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Mae") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Serie">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Filha.Serie") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Escola">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Escola") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Profissão">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Proficional.Profissao") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Área">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Proficional.Area") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:DetailsView>
                            </dd>
                        </dl>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Assuntos" style="width: 100%;" class="td_dados">
            aprovar Assuntos e Conteudo do Assunto
        </div>
        <div id="Temas" style="width: 100%;" class="td_dados">
            <b>Todos os temas</b><br />
            <asp:UpdatePanel ID="UpdatePanelTemas" runat="server">
                <ContentTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSourceTemas" runat="server" SelectMethod="getAllTema" TypeName="LeComCre.Web.Negocios.Temas">
                    </asp:ObjectDataSource>
                    <asp:GridView ID="GridViewTemas" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourceTemas"
                        ForeColor="Black" GridLines="None" OnRowCommand="GridViewTemas_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Tema_id" HeaderText="Tema_id" SortExpression="Tema_id" Visible="False" />
                            <asp:BoundField DataField="Tema" HeaderText="Tema" SortExpression="Tema" />
                            <asp:BoundField DataField="Descricao" HeaderText="Descri&ccedil;&atilde;o" SortExpression="Descricao" />
                            <asp:BoundField DataField="DtEvento" HeaderText="Evento" SortExpression="DtEvento" />
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Tema_id") %>' CommandName="Select"
                                        ImageUrl="~/images/Edit_Text.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Jogos" style="width: 100%;" class="td_dados">
            sei la o que ter&aacute; aqui.
        </div>
        <div id="Historico" style="width: 100%;" class="td_dados">
            <b>Dados dos Historicos</b><br />
            <div id="accordion" style="width: 95%">
                <h3>
                    <a href="#">Por Usuario</a></h3>
                <div>
                    <b>Historico de Usuario</b><br />
                    <asp:UpdatePanel ID="UpdatePanelHistoricoUsuario" runat="server">
                        <ContentTemplate>
                            <asp:ObjectDataSource ID="ObjectDataSourceHistoricoUsuario" runat="server"></asp:ObjectDataSource>
                            <table border="0" cellpadding="1" cellspacing="1" width="100%">
                                <tr>
                                    <td class="td_dados">
                                        E-Mail
                                    </td>
                                    <td colspan="5" class="td_dados">
                                        <asp:TextBox ID="txtUsuarioMail" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="td_dados">
                                        Pediodo:
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_dados">
                                    </td>
                                    <td class="td_dados">
                                        De:
                                    </td>
                                    <td class="td_dados">
                                        <asp:TextBox ID="txtUsuarioDe" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td class="td_dados">
                                        At&eacute;:
                                    </td>
                                    <td class="td_dados">
                                        <asp:TextBox ID="txtUsuarioAte" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnUsuarioBuscar" runat="server" Text="Buscar" CssClass="button" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="td_dados">
                                        <b>Acesso a Pagina</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <h3>
                    <a href="#">Por Pagina</a></h3>
                <div>
                    <b>Historico de Pagina</b><br />
                    <asp:ObjectDataSource ID="ObjectDataSourceHistoricoPagina" runat="server"></asp:ObjectDataSource>
                </div>
                <h3>
                    <a href="#">Por Bate-Papo</a></h3>
                <div>
                    <b>Historico do Bate-papo</b><br />
                    <asp:ObjectDataSource ID="ObjectDataSourceHistoricoBatePapo" runat="server"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
