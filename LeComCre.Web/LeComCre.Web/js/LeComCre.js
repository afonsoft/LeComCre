
/////// METODO PARA ALTERAR O TAMANHO DA FONTE
//pega todas as tags que será aumentada  
var tagAlvo = new Array('p', 'span', 'a'); 
// Especificando os possíveis tamanhos de fontes, poderia ser: x-small, small... 
var tamanhos = new Array('8px', '9px', '10px', '11px', '12px', '13px', '14px', '15px', '16px', '17px');
var tamanhoInicial = 3;

function mudaTamanho(idAlvo, acao) {
    if (!document.getElementById)
        return

    var selecionados = null, tamanho = tamanhoInicial, i, j, tagsAlvo;

    tamanho += acao;

    if (tamanho <= 0) tamanho = 0;
    if (tamanho > 9) tamanho = 9;

    tamanhoInicial = tamanho;

    if (!(selecionados = document.getElementById(idAlvo)))
        selecionados = document.getElementsByTagName(idAlvo)[0];

    selecionados.style.fontSize = tamanhos[tamanho];

    for (i = 0; i < tagAlvo.length; i++) {
        tagsAlvo = selecionados.getElementsByTagName(tagAlvo[i]);
        for (j = 0; j < tagsAlvo.length; j++)
            tagsAlvo[j].style.fontSize = tamanhos[tamanho];
    }
}} // Fim do código de Aumentar/ Diminuir a letra  
////// FIM DO METODO

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


function isValidEmail(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
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
    jQuery.noConflict();
    //jQuery('#dialogAlert').dialog("destroy");
    jQuery('#dialogAlert').dialog({
        autoOpen: false, bgiframe: false, hide: 'explode', resizable: true, draggable: true,
        modal: true, show: 'slide', width: 350, height: 240, minHeight: 180, minWidth: 240,
        maxHeight: 480, maxWidth: 640, title: "Informações",
        buttons: { "Ok": function() { jQuery('#dialogAlert').dialog("close"); }
        }
    });

    jQuery("button, input:submit, input:button").button();
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

//Metodo para criar um alert;
function AvisoRedirect(texto, url) {
    jQuery(document).ready(function() {
        EndRequestHandler(this, null);
        var p = document.getElementById("pAlert");
        p.innerText = texto;
        jQuery('#dialogAlert').dialog({ buttons: { "Ok": function() { jQuery('#dialogAlert').dialog("close"); window.location.href = url; } } });
        jQuery('#dialogAlert').dialog("open");
        return false;
    });
    return false;
};

//Metodo para criar um alert;
function ConfirmAviso(texto, Event) {
    jQuery(document).ready(function() {
        EndRequestHandler(this, null);
        var p = document.getElementById("pAlert");
        p.innerText = texto;
        jQuery('#dialogAlert').dialog({
        buttons:
            { 
                "Sim": function() { jQuery('#dialogAlert').dialog("close"); Event; },
                "Não": function() { jQuery('#dialogAlert').dialog("close"); }
            } 
        });
        jQuery('#dialogAlert').dialog("open");
        return false;
    });
    return false;
};  