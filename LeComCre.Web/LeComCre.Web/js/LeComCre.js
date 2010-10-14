
function CancelPostBack() {
    if (typeof (Sys) !== 'undefined') {
        try {
            var objMan = Sys.WebForms.PageRequestManager.getInstance();
            if (objMan.get_isInAsyncPostBack())
                objMan.abortPostBack();
        } catch (e) { }
    }
}
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

jQuery(document).ready(function() {
    EndRequestHandler(this, null);
});

if (typeof (Sys) !== 'undefined') {
    try {
        var PageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
        if (PageRequestManager != null)
            PageRequestManager.add_endRequest(EndRequestHandler);
    } catch (e) { }
}

function EndRequestHandler(sender, args) {
    jQuery('#dialogAlert').dialog({
        autoOpen: false, bgiframe: false, hide: 'explode', resizable: true, draggable: true,
        modal: true, show: 'slide', width: 280, height: 150, minHeight: 100, minWidth: 200,
        maxHeight: 480, maxWidth: 640, title: "Aviso",
        buttons: { "Ok": function() { jQuery('#dialogAlert').dialog("close"); }
        }
    });
}

//Metodo para criar um alert;
function Aviso(texto) {
    jQuery(document).ready(function() {
        EndRequestHandler(this, null);
        var p = document.getElementById("pAlert");
        p.innerText = texto;
        jQuery('#dialogAlert').dialog("open");
        return false;
    });
    return false;
};  