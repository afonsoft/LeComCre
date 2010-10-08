if (typeof (Sys) !== 'undefined') {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (prm != null) {
        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);
    }
}


jQuery(document).ready(function() {
    EndRequestHandler(null, null);
});

function BeginRequestHandler(sender, args) {
    var elem;
    if (args != null) {
        elem = args.get_postBackElement();
    }    
}

//Todos os metodos do JQuery devem está neste metodo de inicialização.
function EndRequestHandler(sender, args) {

    //Alert da MasterPage
    jQuery('#AlertMsg').dialog({
        autoOpen: false, bgiframe: false, hide: 'explode', resizable: true, draggable: true,
        modal: true, show: 'slide', minHeight: 120, minWidth: 230,
        maxHeight: 480, maxWidth: 640, title: "Aviso",
        buttons: { "Ok": function() { jQuery('#AlertMsg').dialog("close"); return true; } }
    });
   
    //Verificar se ocorreu um erro no PostBack do Ajax
    if (args != null) {
        if (args.get_error() != undefined) {
            Msg(args.get_error().message, 400, 200);
            args.set_errorHandled(true);
        }
    }
        
}

//Cancelar um postback do ajax
function CancelPostBack() {
    if (typeof (Sys) !== 'undefined') {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            if (prm.get_isInAsyncPostBack()) {
                prm.abortPostBack();
                return true;
            }
        }
    }
    return true;
}
// Recuperar o tamanho da pagina
function pageWidth() {
    return window.innerWidth != null ? window.innerWidth : document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body != null ? document.body.clientWidth : null;
}
function pageHeight() {
    return window.innerHeight != null ? window.innerHeight : document.documentElement && document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body != null ? document.body.clientHeight : null;
}
function posLeft() {
    return typeof window.pageXOffset != 'undefined' ? window.pageXOffset : document.documentElement && document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft ? document.body.scrollLeft : 0;
}
function posTop() {
    return typeof window.pageYOffset != 'undefined' ? window.pageYOffset : document.documentElement && document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop ? document.body.scrollTop : 0;
}
// fim do tamanho

function Msg(texto, w, h) {

    var p = document.getElementById("pAlertMsg");
    p.innerText = texto;
    if ((w == null || w == '') || (h == '' || h == null)) {
        w = 320; h = 240;
    }
    jQuery('#AlertMsg').dialog({ width: w, height: h });
    jQuery('#AlertMsg').dialog('open');
    return true;
};
