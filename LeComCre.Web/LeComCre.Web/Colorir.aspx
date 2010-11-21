<%@ Page Title="" Language="C#" MasterPageFile="~/MenuDefault.Master" AutoEventWireup="true"
    CodeBehind="Colorir.aspx.cs" Inherits="LeComCre.Web.Colorir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuTitulo" runat="server">
    <span style="font-family: Verdana; font-size: x-large;">Imagens para Colorir</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuDireito" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSourceColorir" runat="server" SelectMethod="getColorir"
        TypeName="LeComCre.Web.Negocios.Aplicativos"></asp:ObjectDataSource>
    <asp:Repeater ID="RepeaterColorir" runat="server" DataSourceID="ObjectDataSourceColorir" OnItemCommand="RepeaterColorir_ItemCommand">
        <HeaderTemplate>
            <span class="td_dados">Selecione uma imagem:</span>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:LinkButton ID="lnkTemas" Style="font-family: Verdana, Tahoma, Arial; color: Black; text-align: left;
                    font-size: 9px;" runat="server" CommandName="View" CommandArgument='<%# Eval("Colorir_id") %>'
                    Text='<%# Eval("descricao") %>'></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MenuCorpo" runat="server">

    <script type="text/javascript" language="jscript">
        PositionX = 100;
        PositionY = 100;
        defaultWidth = 500;
        defaultHeight = 500;

        try {
            if (parseInt(navigator.appVersion.charAt(0)) >= 4) {
                var isNN = (navigator.appName == "Netscape") ? 1 : 0;
                var isIE = (navigator.appName.indexOf("Microsoft") != -1) ? 1 : 0;
            }
            var optNN = 'scrollbars=no,status=no,width=' + defaultWidth + ',height=' + defaultHeight + ',left=' + PositionX + ',top=' + PositionY;
            var optIE = 'scrollbars=no,status=no,width=' + defaultWidth + ',height=' + defaultHeight + ',left=' + PositionX + ',top=' + PositionY;
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
                imgWin.document.writeln('           if (isIE){');
                imgWin.document.writeln('               window.resizeTo(100,100);');
                imgWin.document.writeln('               width=100-(document.body.clientWidth-document.images[0].width);');
                imgWin.document.writeln('               height=100-(document.body.clientHeight-document.images[0].height);');
                imgWin.document.writeln('               window.resizeTo(width,height);}');
                imgWin.document.writeln('           if (isNN){');
                imgWin.document.writeln('               window.innerWidth=document.images["Colorir"].width;');
                imgWin.document.writeln('               window.innerHeight=document.images["Colorir"].height;}}');
                imgWin.document.writeln('       function doTitle(){document.title="Imprimir a Imagem a Colorir";}');
                imgWin.document.writeln('   </sc' + 'ript>');
                imgWin.document.writeln('</head><body bgcolor=FFFFFF onload="reSizeToImage();doTitle();self.focus();self.print();">')
                imgWin.document.writeln('<form><A HREF="javascript:window.print()"><img name="Colorir" id="Colorir" src="' + imageURL + '" style="display:block" onclick="window.print(); self.print();" ></A>');
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
                imgWin.document.writeln('</sc' + 'ript>');
                imgWin.document.writeln('</form></body></html>');
                imgWin.print();
            } catch (e) { }
        }
    </script>

    <div id="CorpoColorir" style="width: 100%; height: 100% auto; vertical-align: text-top; text-align: justify;
        display: none;" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td style="width: 385px;">
                    <asp:Label ID="lblTitle" runat="server" Text="" Style="font-family: Verdana; font-size: x-large;"></asp:Label>
                </td>
                <td>
                    <img alt="Imprimir a Foto" id="imgPrint" src="/images/printImage.png" runat="server" style="width: 64px;
                        height: 64px;" onmouseover="this.style.cursor='hand';" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ImageButton ID="imgDownload" runat="server" OnClick="imgDownload_Click" AlternateText="Download da Foto" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
