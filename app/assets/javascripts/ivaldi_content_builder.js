//= require jquery
//= require jquery_ujs
//= require cocoon
//= require html.sortable.min

(function($) {
  function setCorrectOrder() {
    $("[data-ivaldi-content-blocks] .nested-fields").each(function(index) {
      $(this).find("[data-sequence]").val(index);
    });
  }

  $(document).on("ready page:load turbolinks:load", function() {
    if ($("[data-ivaldi-content-blocks]").length > 0) {
      sortable("[data-ivaldi-content-blocks]", {
        placeholderClass: "sortable-placeholder",
        forcePlaceholderSize: true
      })[0].addEventListener("sortupdate", function(e) {
        setCorrectOrder();
      });
    }
  });
})(jQuery);
