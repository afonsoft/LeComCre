<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"
    Inherits="LeComCre.Web.Admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
    <style type="text/css">
        body
        {
            background-color: #F9f6bd;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function() {
            EndRequest(this, null);
        });

        function EndRequest(sender, arg) {
            EndRequestHandler(sender, arg);
            jQuery("#tabs").tabs({ collapsible: true }).find(".ui-tabs-nav").sortable({ axis: 'x' });
            jQuery("#accordion, #accordionJogo, #accordionColorir").accordion({ autoHeight: false, navigation: true });

            jQuery('#<%= txtUsuarioDe.ClientID %>, #<%= txtUsuarioAte.ClientID %>, #<%= txtPaginaDe.ClientID %>, #<%= txtPaginaAte.ClientID %>, #<%= txtBateAte.ClientID %>, #<%= txtBateDe.ClientID %>, #<%= txtCadastrarEventoJogo.ClientID %>, #<%= txtCadastrarColorirEvento.ClientID %>').datepicker({
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
                showOn: 'both',
                showAnim: 'blind',
                showButtonPanel: true,
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
        function OpenUploadFile(path) {
            jQuery(document).ready(function() {
                EndRequest(this, null);
                jQuery('#dialogUpload').dialog({
                    autoOpen: false, bgiframe: false, hide: 'slide', resizable: true, draggable: true,
                    modal: true, show: 'slide', width: 350, height: 110, minHeight: 80, minWidth: 240,
                    maxHeight: 340, maxWidth: 480, closeOnEscape: true,
                    title: "Upload de arquivos"
                });
                document.getElementById('<%= HiddenFieldPath.ClientID %>').value = path;
                jQuery('#dialogUpload').parent().appendTo(jQuery("form:first"));
                jQuery('#dialogUpload').dialog('open');
            });
        }

        if (typeof (Sys) !== 'undefined') {
            try {
                var PageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
                if (PageRequestManager != null)
                    PageRequestManager.add_endRequest(EndRequest);
            } catch (e) { }
        }

        function uploadComplete(sender, args) {
            jQuery(document).ready(function() {
                jQuery('#dialogUpload').dialog("close");
                jQuery('#dialogUpload').dialog("destroy");
            });
            document.getElementById('<%= txtCadastrarUrlJogo.ClientID %>').value = args.get_fileName();
            document.getElementById('<%= txtCadastrarColorirUrl.ClientID %>').value = args.get_fileName();
            document.getElementById('myThrobber').style.display = "none";
        }
        function uploadStarted(sender, args) {
            document.getElementById('myThrobber').style.display = "block";
        }
        function uploadError(sender, args) {
            document.getElementById('Error').innerText = args.get_errorMessage();
        }
    </script>

    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800px">
            <tr style="height: 100px;">
                <td align="left" valign="top">
                    <a href="Default.aspx">
                        <img name="master_r1_c1" src="images/bate_papo_r1_c1.gif" width="267" height="89" border="0" id="master_r1_c1"
                            alt="" /></a>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <div id="tabs" style="width: 95%;" class="td_dados">
                                            <ul>
                                                <li><a href="#Usuarios">Usuarios</a></li>
                                                <li><a href="#Assuntos">Assuntos</a></li>
                                                <li><a href="#Temas">Temas</a></li>
                                                <li><a href="#Jogos">Jogos</a></li>
                                                <li><a href="#Colorir">Colorir</a></li>
                                                <li><a href="#Historico">Historico Log</a></li>
                                            </ul>
                                            <div id="Usuarios" style="width: 95%;" class="td_dados">
                                                <b>Usuarios Aguardando Aprova&ccedil;&atilde;o</b><br />
                                                <asp:UpdatePanel ID="UpdatePanelUsuarios" runat="server">
                                                    <ContentTemplate>
                                                        <asp:ObjectDataSource ID="ObjectDataSourceUsuario" runat="server" SelectMethod="getUsuariosByName"
                                                            TypeName="LeComCre.Web.Negocios.NegUsuario">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="txtNomeUsuarioAprov" Name="nome" PropertyName="Text" Type="String" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                        <table width="95%">
                                                            <tr>
                                                                <td>
                                                                    Nome Usuario:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtNomeUsuarioAprov" Width="120px" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btnBuscarUsuarioAprov" runat="server" Text="Buscar" OnClick="btnBuscarUsuarioAprov_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
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
                                                                <asp:TemplateField HeaderText="Situa&ccedil;&atilde;o">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# (Eval("Ativo").ToString() == "1" ? "Ativo" : "Bloqueado") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Width="50px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Op&ccedil;&otilde;es">
                                                                    <ItemTemplate>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="95%">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgView" runat="server" AlternateText="Visualizar Detalhe do Usuario"
                                                                                        CommandArgument='<%# Eval("Usuario_id") %>' CommandName="Select" ImageUrl="~/images/View_text.png"
                                                                                        Width="22px" Height="22px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgAprov" runat="server" AlternateText="Aprovar o Usuario" CommandArgument='<%# Eval("Usuario_id") %>'
                                                                                        OnClientClick="javascript:return confirm('Deseja aprovar este usu&aacute;rio?');" CommandName="Aprov"
                                                                                        ImageUrl="~/images/AprovUser.png" Width="22px" Height="22px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="bloquear o Usuario" CommandArgument='<%# Eval("Usuario_id") %>'
                                                                                        OnClientClick="javascript:return confirm('Deseja bloquear este usu&aacute;rio?');" CommandName="Reprov"
                                                                                        ImageUrl="~/images/ExcluirUser.png" Width="22px" Height="22px" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Width="60px" />
                                                                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="Tan" />
                                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                        </asp:GridView>
                                                        <br />
                                                        <div>
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
                                                                </dl>
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
                                                                                <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Tipo_Usuario.Descricao").ToString() %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CPF">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCpf" runat="server" Text='<%# Eval("Usuario_Pai.CPF") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Pai">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblpai" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Pai") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="M&atilde;e">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMae" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Mae") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Serie">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerie" runat="server" Text='<%# Eval("Usuario_Filha.Serie") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Escola">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEscola" runat="server" Text='<%# Eval("Usuario_Filha.Nome_Escola") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Profiss&atilde;o">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblProf" runat="server" Text='<%# Eval("Usuario_Proficional.Profissao") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="&Aacute;rea">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblArea" runat="server" Text='<%# Eval("Usuario_Proficional.Area") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Fields>
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <EditRowStyle BackColor="#7C6F57" />
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                </asp:DetailsView>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div id="Assuntos" style="width: 95%;" class="td_dados">
                                                <b>Aprovar Assuntos e Conteudo do Assunto</b><br />
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
                                                        <asp:GridView ID="GridViewAssuntos" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourceAssuntos"
                                                            ForeColor="Black" GridLines="None" OnRowCommand="GridViewAssuntos_RowCommand" EmptyDataText="Nenhum registro encontrado.">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Apelido">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Usuario.Apelido") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Assunto" HeaderText="Assunto" SortExpression="Assunto" />
                                                                <asp:BoundField DataField="Descricao" HeaderText="Descri&ccedil;&atilde;o" SortExpression="Descricao" />
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgView" runat="server" AlternateText="" CommandArgument='<%# Eval("Assunto_id") %>'
                                                                                        CommandName="View" ImageUrl="~/images/View_text.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Assunto_id") %>' CommandName="Aprov"
                                                                                        ImageUrl="~/images/Check.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgExcluir" runat="server" CommandArgument='<%# Eval("Assunto_id") %>'
                                                                                        CommandName="ReAprov" ImageUrl="~/images/ExcluirUser.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Width="80px" />
                                                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="Tan" />
                                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:GridView ID="GridViewConteudoAssunto" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSourceConteudoAssunto"
                                                            ForeColor="Black" GridLines="None" OnRowCommand="GridViewConteudoAssunto_RowCommand" EmptyDataText="Nenhum registro encontrado.">
                                                            <Columns>
                                                                <asp:BoundField DataField="Assunto_id" HeaderText="idAssunto" SortExpression="Assunto_id" />
                                                                <asp:TemplateField HeaderText="Apelido">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Usuario.Apelido") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Comentario" HeaderText="Comentario" SortExpression="Comentario" />
                                                                <asp:BoundField DataField="Ativo" HeaderText="Ativo" SortExpression="Ativo" />
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgView" runat="server" AlternateText="" CommandArgument='<%# Eval("Assunto_id") %>'
                                                                                        CommandName="View" ImageUrl="~/images/View_text.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<%# Eval("Conteudo_Assunto_id") %>'
                                                                                        CommandName="Aprov" ImageUrl="~/images/Check.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgExcluir" runat="server" CommandArgument='<%# Eval("Conteudo_Assunto_id") %>'
                                                                                        CommandName="ReAprov" ImageUrl="~/images/ExcluirUser.png" Width="16px" Height="16px" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Width="80px" />
                                                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
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
                                            <div id="Temas" style="width: 95%;" class="td_dados">
                                                <table width="98%" border="0">
                                                    <tr>
                                                        <td style="width: 88%;">
                                                            <b>Todos os Temas</b>
                                                        </td>
                                                        <td align="center" style="width: 15%;">
                                                            <a href='<%= "Tema.aspx?p=" + Afonsoft.Libary.Cryptographic.Encryption.Criptografar(0 + "|2")+ "&rtl=admin.aspx" %>'>
                                                                Novo Tema</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
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
                                                                                <HeaderStyle Width="50px" />
                                                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
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
                                            <div id="Jogos" style="width: 95%;" class="td_dados">
                                                <table border="0" width="97%">
                                                    <tr>
                                                        <td>
                                                            Jogos
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanelJogos" UpdateMode="Always" runat="server">
                                                                <ContentTemplate>
                                                                    <div id="accordionJogo" style="width: 98%">
                                                                        <h3>
                                                                            <a href="#">Jogos</a></h3>
                                                                        <div>
                                                                            <asp:ObjectDataSource ID="ObjectDataSourceJogos" runat="server" SelectMethod="getJogos" TypeName="LeComCre.Web.Negocios.Aplicativos">
                                                                            </asp:ObjectDataSource>
                                                                            <asp:GridView ID="GridViewJogos" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="false"
                                                                                BackColor="LightGoldenrodYellow" DataKeyNames="Jogo_id" BorderColor="Tan" BorderWidth="1px"
                                                                                CellPadding="2" ForeColor="Black" GridLines="None" AllowSorting="True" DataSourceID="ObjectDataSourceJogos"
                                                                                OnRowCommand="GridViewJogos_RowCommand">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="Jogo_id" HeaderText="Jogo_id" SortExpression="Jogo_id" Visible="false" />
                                                                                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                                                                    <asp:BoundField DataField="Url" HeaderText="Arquivo" SortExpression="Url" />
                                                                                    <asp:BoundField DataField="dtEvento" HeaderText="Evento" SortExpression="dtEvento" />
                                                                                    <asp:TemplateField HeaderText="Excluir">
                                                                                        <ItemTemplate>
                                                                                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Excluir" CommandArgument='<%# Eval("Jogo_id") %>'
                                                                                                OnClientClick="javascript:return confirm('Deseja excluir este item?');" CommandName="Excluir"
                                                                                                ImageUrl="~/images/ExcluirUser.png" Width="22px" Height="22px" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Width="50px" />
                                                                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="Tan" />
                                                                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                                                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                                                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                        <h3>
                                                                            <a href="#">Cadastrar</a></h3>
                                                                        <div>
                                                                            <table width="95%" border="0" cellpadding="1" cellspacing="1">
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Nome:
                                                                                    </td>
                                                                                    <td class="td_dados" style="white-space: nowrap; min-width: 250px; width: auto;">
                                                                                        <asp:TextBox ID="txtCadastrarNomeJogo" runat="server" Width="200px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Data Evento:
                                                                                    </td>
                                                                                    <td class="td_dados" style="white-space: nowrap; min-width: 250px; width: auto;">
                                                                                        <asp:TextBox ID="txtCadastrarEventoJogo" runat="server" Width="70px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Arquivo:
                                                                                    </td>
                                                                                    <td class="td_dados" style="white-space: nowrap; min-width: 250px; width: auto;">
                                                                                        <asp:TextBox ID="txtCadastrarUrlJogo" runat="server" Width="150px"></asp:TextBox>
                                                                                        <input id="Button1" type="button" value="Procurar" class="button" onclick="OpenUploadFile('Jogos');" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        <asp:Button ID="btnCadastrarJogo" runat="server" Text="Cadastrar" CssClass="button" OnClick="btnCadastrarJogo_Click" />
                                                                                    </td>
                                                                                    <td align="right" style="white-space: nowrap; min-width: 250px; width: auto;">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="Colorir" style="width: 95%;" class="td_dados">
                                                <table border="0" width="97%">
                                                    <tr>
                                                        <td>
                                                            Para Colorir
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanelColorir" UpdateMode="Always" runat="server">
                                                                <ContentTemplate>
                                                                    <div id="accordionColorir" style="width: 98%">
                                                                        <h3>
                                                                            <a href="#">Colorir</a></h3>
                                                                        <div>
                                                                            <asp:ObjectDataSource ID="ObjectDataSourceColorir" runat="server" SelectMethod="getColorir"
                                                                                TypeName="LeComCre.Web.Negocios.Aplicativos"></asp:ObjectDataSource>
                                                                            <asp:GridView ID="GridViewColorir" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="false"
                                                                                BackColor="LightGoldenrodYellow" DataKeyNames="Colorir_id" BorderColor="Tan" BorderWidth="1px"
                                                                                CellPadding="2" ForeColor="Black" GridLines="None" AllowSorting="True" DataSourceID="ObjectDataSourceColorir"
                                                                                OnRowCommand="GridViewColorir_RowCommand">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="Colorir_id" HeaderText="Colorir_id" SortExpression="Colorir_id"
                                                                                        Visible="false" />
                                                                                    <asp:BoundField DataField="descricao" HeaderText="Nome" SortExpression="descricao" />
                                                                                    <asp:BoundField DataField="Url" HeaderText="Arquivo" SortExpression="Url" />
                                                                                    <asp:BoundField DataField="dtEvento" HeaderText="Evento" SortExpression="dtEvento" />
                                                                                    <asp:TemplateField HeaderText="Excluir">
                                                                                        <ItemTemplate>
                                                                                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Ecluir" CommandArgument='<%# Eval("Colorir_id") %>'
                                                                                                OnClientClick="javascript:return confirm('Deseja excluir este item?');" CommandName="Excluir"
                                                                                                ImageUrl="~/images/ExcluirUser.png" Width="22px" Height="22px" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Width="50px" />
                                                                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="Tan" />
                                                                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                                                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                                                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                        <h3>
                                                                            <a href="#">Cadastrar</a></h3>
                                                                        <div>
                                                                            <table width="95%" border="0" cellpadding="1" cellspacing="1">
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Nome:
                                                                                    </td>
                                                                                    <td class="td_dados">
                                                                                        <asp:TextBox ID="txtCadastrarColorirNome" runat="server" Width="200px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Data Evento:
                                                                                    </td>
                                                                                    <td class="td_dados" style="white-space: nowrap; width: 100px;">
                                                                                        <asp:TextBox ID="txtCadastrarColorirEvento" runat="server" Width="70px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        Arquivo:
                                                                                    </td>
                                                                                    <td class="td_dados">
                                                                                        <asp:TextBox ID="txtCadastrarColorirUrl" runat="server" Width="150px"></asp:TextBox>
                                                                                        <input id="Button2" type="button" value="Procurar" class="button" onclick="OpenUploadFile('Colorir');" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td_dados" style="width: 15%;">
                                                                                        <asp:Button ID="btnCadastrarColorir" runat="server" Text="Cadastrar" CssClass="button" OnClick="btnCadastrarColorir_Click" />
                                                                                    </td>
                                                                                    <td align="right">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="Historico" style="width: 95%;" class="td_dados">
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
                                                                        <td class="td_dados" style="width: 100px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtUsuarioDe" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td class="td_dados" style="width: 30px;">
                                                                            At&eacute;:
                                                                        </td>
                                                                        <td class="td_dados" style="width: 100px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtUsuarioAte" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Button ID="btnUsuarioBuscar" runat="server" Text="Buscar" CssClass="button" OnClick="btnUsuarioBuscar_Click" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6" class="td_dados">
                                                                            <b>Acesso a Pagina</b>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <asp:GridView ID="GridViewUsuarioAcessoPaginas" runat="server" AllowPaging="True" Width="96%"
                                                                                AutoGenerateColumns="true" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px"
                                                                                CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
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
                                                                            <asp:GridView ID="GridViewUsuarioHistoricoBatePapo" runat="server" AllowPaging="True" Width="95%"
                                                                                AutoGenerateColumns="true" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px"
                                                                                CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Nenhum registro encontrado."
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
                                                        <asp:UpdatePanel ID="UpdatePanelHistoricoPagina" runat="server">
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
                                                                        <td class="td_dados" style="width: 120px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtPaginaDe" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td class="td_dados" style="width: 20px;">
                                                                            At&eacute;:
                                                                        </td>
                                                                        <td class="td_dados" style="width: 120px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtPaginaAte" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Button ID="btnPaginaBuscar" runat="server" Text="Buscar" CssClass="button" OnClick="btnPaginaBuscar_Click" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <asp:GridView ID="GridViewPagina" runat="server" AllowPaging="True" Width="96%" AutoGenerateColumns="true"
                                                                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                                                                                GridLines="None" EmptyDataText="Nenhum registro encontrado." OnPageIndexChanging="GridViewPagina_PageIndexChanging">
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
                                                        <asp:UpdatePanel ID="UpdatePanelHistoricoBatePapo" runat="server">
                                                            <ContentTemplate>
                                                                <asp:ObjectDataSource ID="ObjectDataSourceHistoricoBatePapo" runat="server" SelectMethod="getHistoricoBatePapo"
                                                                    TypeName="LeComCre.Web.Negocios.NegUsuario">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="txtBatePalavra" Name="Palavra" PropertyName="Text" Type="String" />
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
                                                                        <td class="td_dados" style="width: 120px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtBateDe" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td class="td_dados" style="width: 20px;">
                                                                            At&eacute;:
                                                                        </td>
                                                                        <td class="td_dados" style="width: 120px; white-space: nowrap;">
                                                                            <p>
                                                                                <asp:TextBox ID="txtBateAte" runat="server" Width="70px"></asp:TextBox></p>
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Button ID="btnBateBuscar" runat="server" Text="Buscar" CssClass="button" OnClick="btnBateBuscar_Click" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <asp:GridView ID="GridViewHistoricoPapoUser" runat="server" AllowPaging="True" Width="96%"
                                                                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                                                                                GridLines="None" EmptyDataText="Nenhum registro encontrado." DataSourceID="ObjectDataSourceHistoricoBatePapo"
                                                                                AllowSorting="True">
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
                                        <br />
                                        <div id="dialogUpload" title="Aviso" style="display: none; font-size: x-small; color: Black;
                                            font-family: Verdana; font-style: normal; font-weight: normal;" class="ui-dialog ui-resizable-handle">
                                            <table border="0" cellpadding="1" cellspacing="2" width="95%">
                                                <tr>
                                                    <td>
                                                        Seleione um arquivo para o upload
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <input id="HiddenFieldPath" type="hidden" value="" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:AsyncFileUpload ID="afu_UploadFile" runat="server" OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                                            Width="300px" ThrobberID="myThrobber" CompleteBackColor="#FFF8DC" ErrorBackColor="#00BFFF"
                                                            UploadingBackColor="#F0FFFF" PersistFile="True" UploaderStyle="Traditional" OnClientUploadStarted="uploadStarted"
                                                            OnUploadedComplete="afu_UploadFile_UploadedComplete" CssClass="button td_dados" />
                                                    </td>
                                                    <td>
                                                        <div id="myThrobber" style="display: none;">
                                                            <img alt="" height="16px" width="16px" src="images/ajax-loader.gif" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td_dados" colspan="2">
                                                        <div id="Error" class="td_dados">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="afu_UploadFile" EventName="UploadedComplete" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
