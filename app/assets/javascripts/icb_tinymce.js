//= require tinymce-jquery

function tinymce_inits(){
  tinyMCE.init({
      selector: "textarea.tinymce-tiny",
      statusbar: false,
      menubar: false,
      toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | link | bullist numlist outdent indent',
      paste_as_text: true,
      plugins: "autoresize paste noneditable code lists link"
  });
}

function icbInitTinyMCE(){
  jQuery('.tinymce-tiny').each(function(){
    var tinymce = jQuery(this).tinymce();

    if(tinymce != null){
      tinymce.remove();
    }

    jQuery(this).show();
  });

  tinymce_inits();
}