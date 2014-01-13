/*
  Misc JavaScipt for WineHQ
*/

// include a file from js scripts dir
function include_dom (script_filename) {
    var html_doc = document.getElementsByTagName('head').item(0);
    var js = document.createElement('script');
    js.setAttribute('language', 'javascript');
    js.setAttribute('type', 'text/javascript');
    js.setAttribute('src', script_filename);
    html_doc.appendChild(js);
    return false;
}

// load and execute jquery IE6 PNG fix
include_dom("/jquery.pngfix.js");
jQuery(function($) {
    $("img[@src$=png]").pngfix(); /* all img tags with .png extension */
    $("#tabs li").pngfix(); /* top tabs li backgrounds */
});

// done
