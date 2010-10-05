<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileManager.aspx.cs" Inherits="LeComCre.Web.FileManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Afonsoft.Libary.Web.FileExplorer" Namespace="Afonsoft.Libary.Web.FileExplorer"
    TagPrefix="aft" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
    <link href="CSS/browser.css" rel="stylesheet" type="text/css" />
    <link href="CSS/round.css" rel="stylesheet" type="text/css" />
    <link href="CSS/MasterPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" OnAsyncPostBackError="ToolkitScriptManager1_AsyncPostBackError">
        <Scripts>
            <asp:ScriptReference Path="~/js/jquery-1.4.2.min.js" />
            <asp:ScriptReference Path="~/js/jquery-ui-1.8.5.custom.min.js" />
            <asp:ScriptReference Path="~/js/LeComCre.js" />
            <asp:ScriptReference Path="~/js/fileuploader.js" />
        </Scripts>
    </asp:ToolkitScriptManager>
    <aft:FileSystemDataSource ID="fileSystemDataSource" runat="server" RootPath="Trabalho"
        FoldersOnly="true" IncludeRoot="true">
    </aft:FileSystemDataSource>
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="tvFolders" EventName="SelectedNodeChanged" />
        </Triggers>
        <ContentTemplate>
            <div>
                <div id="browser">
                    <div class="rounded">
                        <div class="top-outer">
                            <div class="top-inner">
                                <div class="top">
                                </div>
                            </div>
                        </div>
                        <div class="mid-outer">
                            <div class="mid-inner">
                                <div class="mid">
                                    <div class="sidebar">
                                        <div class="title">
                                            Pastas</div>
                                        <div class="folders">
                                            <asp:TreeView ID="tvFolders" runat="server" DataSourceID="fileSystemDataSource" CssClass="tree"
                                                ExpandDepth="1" ExpandImageUrl="~/images/plus.gif" CollapseImageUrl="~/images/minus.gif"
                                                PopulateNodesFromClient="false" OnSelectedNodeChanged="TvFolders_SelectedNodeChanged">
                                                <NodeStyle CssClass="node" ImageUrl="~/images/folder.gif" />
                                                <SelectedNodeStyle CssClass="selected-node" />
                                                <DataBindings>
                                                    <asp:TreeNodeBinding DataMember="Name" />
                                                </DataBindings>
                                            </asp:TreeView>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <asp:ListView ID="lvItems" runat="server" OnItemDataBound="ItemDataBound" OnItemCommand="ItemCommand">
                                            <LayoutTemplate>
                                                <%--Core strucutre of the table--%>
                                                <table class="grid" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th class="name">
                                                            Nome
                                                        </th>
                                                        <th class="mod">
                                                            Modificado
                                                        </th>
                                                        <th class="type">
                                                            Tipo
                                                        </th>
                                                        <th class="tamanho">
                                                            Tamanho
                                                        </th>
                                                        <th class="excluir">
                                                            Excluir
                                                        </th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server" />
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <%--Core strucutre of a row--%>
                                                <tr id="item" runat="server">
                                                    <td>
                                                        <%--The image is set when row is databound--%>
                                                        <asp:ImageButton ID="btnItemIcon" runat="server" ImageAlign="AbsMiddle" CommandArgument='<%# Eval("Name") %>' />
                                                        <asp:LinkButton ID="btnItemName" runat="server" Text='<%# Eval("Name") %>' CommandArgument='<%# Eval("Name") %>'
                                                            Font-Underline="false" ForeColor="black" />
                                                    </td>
                                                    <td>
                                                        <%# Eval("LastWriteTime")%>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblType" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSize" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="imgExcluir" runat="server" CommandName="DeleteFile" CommandArgument='<%# Eval("Name") %>'
                                                            ImageUrl="~/images/btnDelete.jpg" Width="16px" Height="16px" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <%--Empty contents - displayed when there are no items--%>
                                                <table class="grid" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th class="name">
                                                            Nome
                                                        </th>
                                                        <th>
                                                            Modificado
                                                        </th>
                                                        <th>
                                                            Tipo
                                                        </th>
                                                        <th>
                                                            Tamanho
                                                        </th>
                                                        <th>
                                                            Excluir
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            Esta pasta está vazia.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                        </asp:ListView>
                                    </div>
                                    <div class="footer">
                                        <div class="details">
                                            <div class="folderinfo">
                                                <div style="float: left;">
                                                    <asp:DetailsView ID="dvFolderDetails" runat="server" FieldHeaderStyle-CssClass="header"
                                                        AutoGenerateRows="false" GridLines="None">
                                                        <Fields>
                                                            <asp:BoundField HeaderText="Pasta" DataField="Name" />
                                                            <asp:BoundField HeaderText="Modificado" DataField="LastWriteTime" />
                                                        </Fields>
                                                    </asp:DetailsView>
                                                </div>
                                                <div style="float: right;">
                                                    <table>
                                                        <tr>
                                                            <td class="header" valign="top" align="left">
                                                                <a href="javascript:void(0);" onclick="return loadDialogDir();">Adicionar Diretário</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="header" valign="top" align="left">
                                                                <a href="javascript:void(0);" onclick="createUploader();return loadDialogFile();">Adicionar
                                                                    Arquivos</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom-outer">
                            <div class="bottom-inner">
                                <div class="bottom">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="dialogAddDir" title="Aviso" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable"
        style="display: none;">
        <div class="ui-dialog-content ui-widget-content" id="pAddDir">
            <dl>
                <dt><b>Adicionar um novo diretório</b></dt>
                <dd>
                    Nome:
                    <asp:TextBox ID="txtAddDir" runat="server" MaxLength="16" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnAddDir" runat="server" Text="OK" Style="display: none;" />
                </dd>
            </dl>
        </div>
    </div>
    <div id="dialogAddFile" title="Aviso" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable"
        style="display: none;">
        <div class="ui-dialog-content ui-widget-content" id="pAddFile">
            <dl>
                <dt><b>Adicionar arquivos ao diretório atual</b></dt>
                <dd>
                    <div id="file-uploader">
                    </div>
                </dd>
            </dl>
        </div>
    </div>
    </form>
</body>
</html>
