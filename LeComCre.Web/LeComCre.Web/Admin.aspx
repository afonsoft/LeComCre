<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"
    CodeBehind="Admin.aspx.cs" Inherits="LeComCre.Web.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPortal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPortal" runat="server">

    <script type="text/javascript">
        jQuery(document).ready(function() {
            jQuery("#tabs").tabs({ collapsible: true }).find(".ui-tabs-nav").sortable({ axis: 'x' });
        });
    </script>

    <div id="tabs" style="width: 100%;" class="td_dados">
        <ul>
            <li><a href="#Usuarios">Usuarios</a></li>
            <li><a href="#Assuntos">Assuntos</a></li>
            <li><a href="#Temas">Temas</a></li>
            <li><a href="#Jogos">Jogos</a></li>
        </ul>
        <div id="Usuarios" style="width: 100%;" class="td_dados">
            <b>Usuarios Aguardando Aprova&ccedil;&atilde;o</b><br />
            <asp:ObjectDataSource ID="ObjectDataSourceUsuario" runat="server" SelectMethod="getUsuariosInativos"
                TypeName="LeComCre.Web.Negocios.NegUsuario"></asp:ObjectDataSource>
            <asp:GridView ID="GridViewUsuario" runat="server" AllowPaging="True" Width="95%"
                AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" DataSourceID="ObjectDataSourceUsuario"
                OnRowCommand="GridViewUsuario_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Usuario_id" HeaderText="Usuario_id" SortExpression="Usuario_id"
                        Visible="False" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="SobreNome" HeaderText="Sobre Nome" SortExpression="SobreNome" />
                    <asp:BoundField DataField="Apelido" HeaderText="Apelido" SortExpression="Apelido" />
                    <asp:TemplateField HeaderText="View | Aprovar">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgView" runat="server" CommandArgument='<%# Eval("Usuario_id") %>'
                                CommandName="View" ImageUrl="~/images/View_text.png" Width="22px" Height="22px" />  
                            <asp:ImageButton ID="imgAprov" runat="server" CommandArgument='<%# Eval("Usuario_id") %>'
                                OnClientClick="javascript:return confirm('Deseja aprovar este usu&aacute;rio?');"
                                CommandName="Aprov" ImageUrl="~/images/Apov_user.png" Width="22px" Height="22px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <div id="Assuntos" style="width: 100%;" class="td_dados">
            aprovar Assuntos e Conteudo do Assunto
        </div>
        <div id="Temas" style="width: 100%;" class="td_dados">
            <b>Todos os temas</b><br />
            <asp:ObjectDataSource ID="ObjectDataSourceTemas" runat="server" SelectMethod="getAllTema"
                TypeName="LeComCre.Web.Negocios.Temas"></asp:ObjectDataSource>
            <asp:GridView ID="GridViewTemas" runat="server" AllowPaging="True" Width="95%" AutoGenerateColumns="False"
                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                DataSourceID="ObjectDataSourceTemas" ForeColor="Black" GridLines="None" OnRowCommand="GridViewTemas_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Tema_id" HeaderText="Tema_id" SortExpression="Tema_id"
                        Visible="False" />
                    <asp:BoundField DataField="Tema" HeaderText="Tema" SortExpression="Tema" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao" />
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
        </div>
        <div id="Jogos" style="width: 100%;" class="td_dados">
            sei la o que ter&aacute; aqui.
        </div>
    </div>
</asp:Content>
