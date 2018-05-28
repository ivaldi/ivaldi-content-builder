//= require jquery
//= require jquery_ujs
//= require cocoon
//= require html.sortable.min
//= require icb_tinymce


function icbInit(){
  if(jQuery('[data-ivaldi-content-blocks]').length > 0){
    icbMakeSortable();
    icbInitTinyMCE();
    setCorrectOrder();
  }
}

function setCorrectOrder() {
  if ($("[data-ivaldi-content-blocks]").length > 0) {
    $("[data-ivaldi-content-blocks] .nested-fields").each(function(index) {
      $(this).find("[data-sequence]").val(index);
    });
  }
}

function icbMakeSortable(){
  sortable("[data-ivaldi-content-blocks]", {
    placeholderClass: "sortable-placeholder",
    forcePlaceholderSize: true
  })[0].addEventListener("sortupdate", function(e) {
    setCorrectOrder();
    icbInitTinyMCE();
  });
}

$(document).on("ready page:load turbolinks:load", function() {
  icbInit();
});
