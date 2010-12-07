<%@ Page Title="" Language="C#" MasterPageFile="~/MasterColorir.Master" AutoEventWireup="true"
    CodeBehind="Colorir.aspx.cs" Inherits="LeComCre.Web.Colorir" EnableEventValidation="false"
    ViewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceColorir" runat="server" SelectMethod="getColorir"
        TypeName="LeComCre.Web.Negocios.Aplicativos"></asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterColorir" runat="server" DataSourceID="ObjectDataSourceColorir" OnItemCommand="RepeaterColorir_ItemCommand">
        <HeaderTemplate>
            <span class="td_dados">Selecione abaixo uma imagem para Colorir:</span><br /><br />
            <table width="100%" border="1" cellpadding="0" cellspacing="0">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="center" valign="top">
                    <asp:ImageButton ID="imgTemas" runat="server" ImageUrl='<%# "~/conteudo/Colorir/" + Eval("url") %>'
                        CommandName="View" CommandArgument='<%# Eval("Colorir_id") %>' Width="48px" Height="48px"
                        AlternateText='<%# Eval("descricao") %>' /><br />
                    <asp:Label ID="lblDecricao" CssClass="td_dados" Style="font-size: 11px" runat="server" Text='<%# Eval("descricao") %>'></asp:Label>
                </td>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <td align="center" valign="top">
                <asp:ImageButton ID="imgTemas" runat="server" ImageUrl='<%# "~/conteudo/Colorir/" + Eval("url") %>'
                    CommandName="View" CommandArgument='<%# Eval("Colorir_id") %>' Width="48px" Height="48px"
                    AlternateText='<%# Eval("descricao") %>' /><br />
                <asp:Label ID="lblDecricao" CssClass="td_dados" Style="font-size: 11px" runat="server" Text='<%# Eval("descricao") %>'></asp:Label>
            </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">

    <script type="text/javascript" language="jscript">
        PositionX = 100;
        PositionY = 100;
        defaultWidth = 100;
        defaultHeight = 100;

        try {
            if (parseInt(navigator.appVersion.charAt(0)) >= 4) {
                var isNN = (navigator.appName == "Netscape") ? 1 : 0;
                var isIE = (navigator.appName.indexOf("Microsoft") != -1) ? 1 : 0;
            }
            var optNN = 'scrollbars=yes,status=yes,location=yes,menubar=yes,resizable=yes,titlebar=yes,toolbar=yes,width=' + defaultWidth + ',height=' + defaultHeight + ',left=' + PositionX + ',top=' + PositionY;
            var optIE = 'scrollbars=yes,status=yes,location=yes,menubar=yes,resizable=yes,titlebar=yes,toolbar=yes,width=' + defaultWidth + ',height=' + defaultHeight + ',left=' + PositionX + ',top=' + PositionY;
        } catch (e) { }

        function popImage(imageURL) {
            try {
                if (isNN) { imgWin = window.open('about:blank', '_blank', optNN); }
                else if (isIE) { imgWin = window.open('about:blank', '_blank', optIE); }
                else { imgWin = window.open('about:blank', '_blank', optIE); }
                imgWin.document.writeln('<html><head><title>Loading...</title><style>body{margin:0px;}</style>');
                imgWin.document.writeln('   <sc' + 'ript>');
                imgWin.document.writeln('       var isNN,isIE;');
                imgWin.document.writeln('       if (parseInt(navigator.appVersion.charAt(0))>=4){');
                imgWin.document.writeln('           isNN=(navigator.appName=="Netscape")?1:0;');
                imgWin.document.writeln('           isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}');
                imgWin.document.writeln('       function reSizeToImage(){');
                imgWin.document.writeln('           try{');
                imgWin.document.writeln('               if (isIE){');
                imgWin.document.writeln('                   width=350+document.images[0].width;');
                imgWin.document.writeln('                   height=300+document.images[0].height;');
                imgWin.document.writeln('                   window.resizeTo(width,height);}');
                imgWin.document.writeln('               if (isNN){');
                imgWin.document.writeln('                   window.innerWidth=350+document.images["Colorir"].width;');
                imgWin.document.writeln('                   window.innerHeight=300+document.images["Colorir"].height;}');
                imgWin.document.writeln('           }catch(e){}}');
                imgWin.document.writeln('       function doTitle(){document.title="Imprimir a Imagem a Colorir";}');
                imgWin.document.writeln('   </sc' + 'ript>');
                imgWin.document.writeln('</head><body bgcolor=FFFFFF onload="reSizeToImage();doTitle();self.focus();self.print();">')
                imgWin.document.writeln('<center><A HREF="javascript:window.print();" onclick="window.print();"><img name="Colorir" id="Colorir" src="' + imageURL + '" style="display:block" onclick="window.print(); self.print();" ></A></center>');
                imgWin.document.writeln('<sc' + 'ript>');
                imgWin.document.writeln('   try{');
                imgWin.document.writeln('       reSizeToImage();');
                imgWin.document.writeln('   }catch(e){} ');
                imgWin.document.writeln('   try{');
                imgWin.document.writeln('       doTitle();');
                imgWin.document.writeln('   }catch(e){} ');
                imgWin.document.writeln('   try{');
                imgWin.document.writeln('       self.focus();');
                imgWin.document.writeln('   }catch(e){}');
                imgWin.document.writeln('   try{');
                imgWin.document.writeln('       self.print();');
                imgWin.document.writeln('   }catch(e) {');
                imgWin.document.writeln('       window.print();');
                imgWin.document.writeln('   }');
                imgWin.document.writeln('   window.setInterval( reSizeToImage,1000);');
                imgWin.document.writeln('</sc' + 'ript>');
                imgWin.document.writeln('</form></body></html>');
                imgWin.print();
            } catch (e) { }
        }
    </script>

    <div id="CorpoColorir" style="width: 100%; height: 100% auto; vertical-align: text-top; text-align: center;
        display: none;" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td style="width: 70%;">
                    <asp:Label ID="lblTitle" runat="server" Text="" Style="font-family: Verdana; font-size: x-large;"></asp:Label>
                </td>
                <td style="width: 30%;" align="right">
                    <img alt="Imprimir a Foto" id="imgPrint" src="/images/Imprimir.gif" runat="server" style="width: 139px;
                        height: 57px;" onmouseover="this.style.cursor='hand';" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:ImageButton ID="imgDownload" runat="server" OnClick="imgDownload_Click" AlternateText="Download da Foto" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <div runat="server" id="lnkFonte">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
