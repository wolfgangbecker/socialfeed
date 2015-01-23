(function(){
  function App() {
    App.prototype.apply_select2 = function() {
      $('select').select2();
    };
    App.prototype.apply_tooltip = function() {
      $('[data-toggle="tooltip"]').tooltip({html: true});
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
  }
  window.App = App;
})();

$(document).ready(function(){
  var app = new App();
  app.apply_select2();
  app.apply_tooltip();
  app.initiate_forms();
});