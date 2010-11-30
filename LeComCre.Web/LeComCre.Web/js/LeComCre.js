
/////// METODO PARA ALTERAR O TAMANHO DA FONTE
//pega todas as tags que será aumentada

function RemoverStr(e) {
    try {
        var str = new String(e);
        //xx-small, x-small, small, medium, large, x-large, xx-large
        str = str.replace("xx-small", "9");
        str = str.replace("x-small", "10");
        str = str.replace("small", "13");
        str = str.replace("medium", "16");
        str = str.replace("xx-large", "32");
        str = str.replace("x-large", "24");
        str = str.replace("large", "18");
        str = str.replace("x", "");
        str = str.replace("r", "");
        str = str.replace("-", "");
        return str;
    } catch (a) {return 13; }
}

var tagAlvo = new Array('p', 'span', 'a', 'div'); 
// Especificando os possíveis tamanhos de fontes, poderia ser: x-small, small... 
function mudaTamanho(idAlvo, acao) {
    if (!document.getElementById)
        return
         
    var selecionados = null, i, j, tagsAlvo;

    if (!(selecionados = document.getElementById(idAlvo)))
        selecionados = document.getElementsByTagName(idAlvo)[0];

    try 
    {
        tamanho = parseInt(selecionados.style.fontSize == "" ? 13 : RemoverStr(selecionados.style.fontSize.replace("px", "")));
        tamanho += acao;

        selecionados.style.fontSize = tamanho + "px";

        for (i = 0; i < tagAlvo.length; i++) {
            tagsAlvo = selecionados.getElementsByTagName(tagAlvo[i]);
            for (j = 0; j < tagsAlvo.length; j++) {
                tamanho = parseInt(tagsAlvo[j].style.fontSize == "" ? 13 : RemoverStr(tagsAlvo[j].style.fontSize.replace("px", "")));
                tamanho += acao;
                tagsAlvo[j].style.fontSize = tamanho + "px";
            }
        }
    } catch (e) { }
} // Fim do código de Aumentar/ Diminuir a letra  
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