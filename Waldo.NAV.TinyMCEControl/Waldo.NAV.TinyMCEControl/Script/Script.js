function InitializeControl(controlid) {
    //var WaldoNAVPadHTMLEditor = '<div id="WaldoNAVPadControl"></div>';
    var WaldoNAVPadHTMLEditor = '<textarea id="WaldoNAVPadControl"></textarea>'
  
    $('#' + controlid).append(WaldoNAVPadHTMLEditor);

    tinymce.init({
        selector: '#WaldoNAVPadControl',
        height: 500,
        theme: 'modern',
        plugins: [
          'advlist autolink lists link image charmap print preview hr anchor pagebreak',
          'searchreplace wordcount visualblocks visualchars code fullscreen',
          'insertdatetime media nonbreaking save table contextmenu directionality',
          'emoticons template paste textcolor colorpicker textpattern imagetools'
        ],
        toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons',
        image_advtab: true,
        templates: [
          { title: 'Test template 1', content: 'Test 1' },
          { title: 'Test template 2', content: 'Test 2' }
        ],

        content_css: [
          '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
          '//www.tinymce.com/css/codepen.min.css'
        ]
    });

}

function InvokeEvent(Method, Arguments) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(Method, Arguments);
}

function GetHTML() {
    InvokeEvent('GetHTMLReady', [tinymce.activeEditor.getContent({ format: 'html' })]);
}

function GetText() {
    InvokeEvent('GetTextReady',[tinymce.activeEditor.getContent({ format: 'text' })]);
}


//function SendRequest(method, arguments) {
    //alert('method: ' + method);
    //alert('arguments' + arguments);

//    if (method === 'SetHTML')
//        tinymce.activeEditor.setContent(arguments.HTML);

//    if (method === 'GetHTML')
//        InvokeEvent('RequestReady', ['{method:GetHTML,HTML: ' + tinymce.activeEditor.getContent({ format: 'raw' }) + '}']);

//}

$(document).ready(function () {
    InitializeControl('controlAddIn');
    
    InvokeEvent('ControlAddInReady', []);
})