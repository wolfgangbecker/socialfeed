(function(){
  function App() {
    App.prototype.apply_select2 = function() {
      $('select').select2();
    };
    App.prototype.apply_tooltip = function() {
      $('[data-toggle="tooltip"]').tooltip({html: true});
    };
    App.prototype.apply_tagsinput = function(){
      $('[data-role="tagsinput"]').tagsinput();
    };
    App.prototype.initiate_forms = function() {
      // Manage entry submit button
      $('.js-form-container').on('click', '.js-submit', function(){
        $(this).closest('form').submit();
      });
      $('.js-form-container').on('keydown', '.form-control', function(e){
        if(e.which == 13){
          e.stopImmediatePropagation();
          $(this).closest('form').submit();
        }
      });
    };
    App.prototype.initiate_selection_form = function() {
      $('.js-selection-form').on('change', 'select', function(){
        $(this).closest('form').submit();
      });
    };
    App.prototype.refresh_content = function($container_selector, $content, callback) { // TODO: Apply this to all views and remove repeated code
      $container_selector.fadeOut("slow", function() {
        $container_selector.html($content);
        $container_selector.fadeIn('slow');
        if(typeof callback !== 'undefined'){
          callback();
        }
      });
    };
  }
  window.App = App;
})();

$(document).ready(function(){
  var app = new App();
  app.apply_select2();
  app.apply_tooltip();
  app.initiate_forms();
  $('#notification').modal();
});