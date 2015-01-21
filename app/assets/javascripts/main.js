(function(){
  function App() {
    App.prototype.apply_select2 = function() {
      $('select').select2();
    }
    App.prototype.apply_tooltip = function() {
      $('[data-toggle="tooltip"]').tooltip({html: true});
    }
  }
  window.App = App;
})();

$(document).ready(function(){
  var app = new App();
  app.apply_select2();
  app.apply_tooltip();
});