
function CancelPostBack() {
    var objMan = Sys.WebForms.PageRequestManager.getInstance();
    if (objMan.get_isInAsyncPostBack())
        objMan.abortPostBack();
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
    var PageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
    if (PageRequestManager != null)
        PageRequestManager.add_endRequest(EndRequestHandler);
}

function EndRequestHandler(sender, args) {
    var dlgDir = jQuery('#dialogAddDir').dialog({
        autoOpen: false,
        bgiframe: false,
        hide: 'explode',
        resizable: true,
        draggable: true,
        modal: true,
        show: 'slide',
        minHeight: 240,
        minWidth: 320,
        maxHeight: 768,
        maxWidth: 1024,
        width: 320,
        height: 240,
        title: "Adicionar nova pasta",
        open: function(type, data) { jQuery('#dialogAddDir').parent().appendTo("form"); },
        buttons: { "Salvar": function() { jQuery('#dialogAddDir').dialog("close"); document.getElementById('<%= btnAddDir.ClientID %>').click(); return true; },
            "Sair": function() { jQuery('#dialogAddDir').dialog("close"); return true; }
        }
    });
    dlgDir.parent().appendTo(jQuery('form:first'));


    var dlgFile = jQuery('#dialogAddFile').dialog({
        autoOpen: false,
        bgiframe: false,
        hide: 'explode',
        resizable: true,
        draggable: true,
        modal: true,
        show: 'slide',
        minHeight: 240,
        minWidth: 320,
        maxHeight: 768,
        maxWidth: 1024,
        width: 400,
        height: 300,
        title: "Adicionar arquivos",
        buttons: { "Sair": function() { jQuery('#dialogAddDir').dialog("close"); return true; }
        }
    }); 
}


function loadDialogDir() {
    jQuery(document).ready(function() {
        EndRequestHandler(this, null);
        jQuery('#dialogAddDir').dialog('open');
    });
    return true;
}

function loadDialogFile() {
    createUploader();
    jQuery(document).ready(function() {
        EndRequestHandler(this, null);
        jQuery('#dialogAddFile').dialog('open');
    });
    return true;
}

   