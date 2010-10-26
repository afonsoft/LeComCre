<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"
    CodeBehind="Admin.aspx.cs" Inherits="LeComCre.Web.Admin" %>

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

            jQuery('#<%= txtUsuarioDe.ClientID %>, #<%= txtUsuarioAte.ClientID %>, #<%= txtPaginaDe.ClientID %>, #<%= txtPaginaAte.ClientID %>, #<%= txtBateAte.ClientID %>, #<%= txtBateDe.ClientID %>').datepicker({
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
            <li><a href="#Colorir">Colorir</a></li>
            <li><a href="#Historico">Historico Log</a></li>
        </ul>
        <div id="Usuarios" style="width: 100%;" class="td_dados">
            <b>Usuarios Aguardando Aprova&ccedil;&atilde;o</b><br />
            <asp:UpdatePanel ID="UpdatePanelUsuarios" runat="server">
                <ContentTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSourceUsuario" runat="server" SelectMethod="getUsuariosByName"
                        TypeName="LeComCre.Web.Negocios.NegUsuario">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtNomeUsuarioAprov" Name="nome" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <table width="100%">
                        <tr>
                            <td>
                                Nome Usuario:
                            </td>
                            <td>
                                <asp:TextBox ID="txtNomeUsuarioAprov" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarUsuarioAprov" runat="server" Text="Buscar" OnClick="btnBuscarUsuarioAprov_Click" />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewUsuario" runat="server" AllowPaging="True" Width="95%"
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" DataKeyNames="Usuario_id"
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                        DataSourceID="ObjectDataSourceUsuario" OnRowCommand="GridViewUsuario_RowCommand">
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
                                        OnClientClick="javascript:return confirm('Deseja aprovar este usu&aacute;rio?');"
                                        CommandName="Aprov" ImageUrl="~/images/Apov_user.png" Width="22px" Height="22px" />
                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Aprovar o Usuario"
                                        CommandArgument='<%# Eval("Usuario_id") %>' OnClientClick="javascript:return confirm('Deseja bloquear este usu&aacute;rio?');"
                                        CommandName="Reprov" ImageUrl="~/images/negado.jpg" Width="22px" Height="22px" />
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
                    <div id="dialogInfoUsuario" title="Aviso" style="display: none; font-size: x-small;
                        color: Black; font-family: Verdana; font-style: normal; font-weight: normal;"
                        class="ui-dialog ui-resizable-handle">
                        <dl>
                            <dt><b><span style="font-size: 11px; font-weight: bold;">Informa&ccedil;&otilde;es</span></b></dt>
                        </dl>
                        <asp:DetailsView ID="DetailsViewInfoUsuario" runat="server" AutoGenerateRows="False"
                            CellPadding="4" DataSourceID="ObjectDataSourceInfoUsuario" ForeColor="#333333"
                            GridLines="None">
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
                                <asp:TemplateField HeaderText="M&atilde;e">
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
                                <asp:TemplateField HeaderText="Profiss&atilde;o">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Proficional.Profissao") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="&Aacute;rea">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario_Proficional.Area") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Assuntos" style="width: 100%;" class="td_dados">
            <b>Aprovar Assuntos e CoAprovar Assuntos e Conteudo do Assunto</b><br />
            <asp:UpdatePanel ID="UpdatePanelAssuntos" runat="server">
                <ContentTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSourceAssuntos" runat="server" SelectMethod="getAllAssunto"
                        TypeName="LeComCre.Web.Negocios.Assuntos">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="Ativo" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSourceConteudoAssunto" runat="server" SelectMethod="getAllConteudoAssuntoInativo"
                        TypeName="LeComCre.Web.Negocios.Assuntos"></asp:ObjectDataSource>
                    <asp:GridView ID="GridViewAssuntos" runat="server" AllowPaging="True" Width="95%"
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourceAssuntos" ForeColor="Black"
                        GridLines="None" OnRowCommand="GridViewAssuntos_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Assunto_id" HeaderText="Assunto_id" SortExpression="Assunto_id" />
                            <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" SortExpression="Usuario_id" />
                            <asp:TemplateField HeaderText="Apelido">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Usuario.Apelido") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Assunto" HeaderText="Assunto" SortExpression="Assunto" />
                            <asp:BoundField DataField="Descricao" HeaderText="Descri&ccedil;&atilde;o" SortExpression="Descricao" />
                            <asp:TemplateField HeaderText="Aprovar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Assunto_id") %>'
                                        CommandName="Aprov" ImageUrl="~/images/Check.png" Width="16px" Height="16px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="GridViewConteudoAssunto" runat="server" AllowPaging="True" Width="95%"
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourceConteudoAssunto"
                        ForeColor="Black" GridLines="None" OnRowCommand="GridViewConteudoAssunto_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Conteudo_Assunto_id" HeaderText="Conteudo_id" SortExpression="Conteudo_Assunto_id" />
                            <asp:BoundField DataField="Assunto_id" HeaderText="Assunto_id" SortExpression="Assunto_id" />
                            <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" SortExpression="Usuario_id" />
                            <asp:TemplateField HeaderText="Apelido">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Usuario.Apelido") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                            <asp:BoundField DataField="Ativo" HeaderText="Ativo" SortExpression="Ativo" />
                            <asp:TemplateField HeaderText="Aprovar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Conteudo_Assunto_id") %>'
                                        CommandName="Aprov" ImageUrl="~/images/Check.png" Width="16px" Height="16px" />
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
        <div id="Temas" style="width: 100%;" class="td_dados">
            <table width="98%" border="0">
                <tr>
                    <td style="width: 88%;">
                        <b>Todos os Temas</b>
                    </td>
                    <td align="center" style="width: 10%;">
                        <a href='<%= "Tema.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(0 + "|2")+ "&rtl=admin.aspx" %>'>
                            Novo Tema</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanelTemas" runat="server">
                            <ContentTemplate>
                                <asp:ObjectDataSource ID="ObjectDataSourceTemas" runat="server" SelectMethod="getAllTema"
                                    TypeName="LeComCre.Web.Negocios.Temas"></asp:ObjectDataSource>
                                <asp:GridView ID="GridViewTemas" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                    DataSourceID="ObjectDataSourceTemas" ForeColor="Black" GridLines="None" OnRowCommand="GridViewTemas_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="Tema_id" HeaderText="Tema_id" SortExpression="Tema_id"
                                            Visible="False" />
                                        <asp:BoundField DataField="Tema" HeaderText="Tema" SortExpression="Tema" />
                                        <asp:BoundField DataField="Descricao" HeaderText="Descri&ccedil;&atilde;o" SortExpression="Descricao" />
                                        <asp:BoundField DataField="DtEvento" HeaderText="Evento" SortExpression="DtEvento" />
                                        <asp:TemplateField HeaderText="Editar">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Tema_id") %>'
                                                    CommandName="Select" ImageUrl="~/images/Edit_Text.png" />
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
                    </td>
                </tr>
            </table>
        </div>
        <div id="Jogos" style="width: 100%;" class="td_dados">
            <table border="0" width="97%">
                <tr>
                    <td>
                        Jogos
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="accordionJogo" style="width: 98%">
                            <h3>
                                <a href="#">Jogos</a></h3>
                            <div>
                                <asp:ObjectDataSource ID="ObjectDataSourceJogos" runat="server"></asp:ObjectDataSource>
                            </div>
                            <h3>
                                <a href="#">Cadastrar</a></h3>
                            <div>
                                
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="Colorir" style="width: 100%;" class="td_dados">
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
                            <table border="0" cellpadding="1" cellspacing="1" width="95%">
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
                                    <td class="td_dados" style="width: 30px;">
                                        De:
                                    </td>
                                    <td class="td_dados" style="width: 100px;">
                                        <asp:TextBox ID="txtUsuarioDe" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td class="td_dados" style="width: 30px;">
                                        At&eacute;:
                                    </td>
                                    <td class="td_dados" style="width: 100px;">
                                        <asp:TextBox ID="txtUsuarioAte" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnUsuarioBuscar" runat="server" Text="Buscar" CssClass="button"
                                            OnClick="btnUsuarioBuscar_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="td_dados">
                                        <b>Acesso a Pagina</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <asp:GridView ID="GridViewUsuarioAcessoPaginas" runat="server" AllowPaging="True"
                                            Width="96%" AutoGenerateColumns="true" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
                                            OnPageIndexChanging="GridViewUsuarioAcessoPaginas_PageIndexChanging">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="td_dados">
                                        <b>Historico do Batepapo</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <asp:GridView ID="GridViewUsuarioHistoricoBatePapo" runat="server" AllowPaging="True"
                                            Width="95%" AutoGenerateColumns="true" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
                                            OnPageIndexChanging="GridViewUsuarioHistoricoBatePapo_PageIndexChanging">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
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
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" width="95%">
                                <tr>
                                    <td class="td_dados">
                                        Por Pagina
                                    </td>
                                    <td colspan="5" class="td_dados">
                                        <asp:TextBox ID="txtPaginaNome" runat="server" Width="90%"></asp:TextBox>
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
                                    <td class="td_dados" style="width: 20px;">
                                        De:
                                    </td>
                                    <td class="td_dados" style="width: 150px;">
                                        <asp:TextBox ID="txtPaginaDe" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td class="td_dados" style="width: 20px;">
                                        At&eacute;:
                                    </td>
                                    <td class="td_dados" style="width: 150px;">
                                        <asp:TextBox ID="txtPaginaAte" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnPaginaBuscar" runat="server" Text="Buscar" CssClass="button" OnClick="btnPaginaBuscar_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <asp:GridView ID="GridViewPagina" runat="server" AllowPaging="True" Width="96%" AutoGenerateColumns="true"
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                            ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
                                            OnPageIndexChanging="GridViewPagina_PageIndexChanging">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <h3>
                    <a href="#">Por Bate-Papo</a></h3>
                <div>
                    <b>Historico do Bate-papo</b><br />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:ObjectDataSource ID="ObjectDataSourceHistoricoBatePapo" runat="server" SelectMethod="getHistoricoBatePapo"
                                TypeName="LeComCre.Web.Negocios.NegUsuario">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtBatePalavra" Name="Palavra" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="txtBateDe" Name="de" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtBateAte" Name="ate" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <table border="0" cellpadding="1" cellspacing="1" width="95%">
                                <tr>
                                    <td class="td_dados">
                                        Por Bate-Papo
                                    </td>
                                    <td colspan="5" class="td_dados">
                                        <asp:TextBox ID="txtBatePalavra" runat="server" Width="90%"></asp:TextBox>
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
                                    <td class="td_dados" style="width: 20px;">
                                        De:
                                    </td>
                                    <td class="td_dados" style="width: 150px;">
                                        <asp:TextBox ID="txtBateDe" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td class="td_dados" style="width: 20px;">
                                        At&eacute;:
                                    </td>
                                    <td class="td_dados" style="width: 150px;">
                                        <asp:TextBox ID="txtBateAte" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnBateBuscar" runat="server" Text="Buscar" CssClass="button" OnClick="btnBateBuscar_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <asp:GridView ID="GridViewHistoricoPapoUser" runat="server" AllowPaging="True" Width="96%"
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                            ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
                                            DataSourceID="ObjectDataSourceHistoricoBatePapo" AllowSorting="True">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
