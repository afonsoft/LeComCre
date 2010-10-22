<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"
    Inherits="LeComCre.Web.Admin" %>

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
            Aprivar Usuarios
        </div>
        <div id="Assuntos" style="width: 100%;" class="td_dados">
            aprovar Assuntos e Conteudo do Assunto
        </div>
        <div id="Temas" style="width: 100%;" class="td_dados">
            Editar e criar Temas
        </div>
        <div id="Jogos" style="width: 100%;" class="td_dados">
            sei la o que terá aqui.
        </div>
    </div>
</asp:Content>
