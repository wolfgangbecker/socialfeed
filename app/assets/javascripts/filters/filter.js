(function() {

  function Filter() {
    console.debug(this.constructor.name + ': instance CREATED');
    this.configure();
  };

  Filter.prototype.configure = function() {
    this.ui = {};
    this.ui.filter_form = '.js-filter-form';
    this.ui.feed_selection = '.js-feed-selection';
  }

  Filter.prototype.initiate_feed_selection = function() {
    $(this.ui.feed_selection).on('change', 'select', function(){
      $(this).closest('form').submit();
    });
  };

  // refresh filter form
  Filter.prototype.refresh_filter_form = function($form) {
    var filter = this;
    $(filter.ui.filter_form).fadeOut("slow", function() {
      $(filter.ui.filter_form).html($form);
      $(filter.ui.filter_form).fadeIn('slow');
      $('select').select2();
    });
  };

  window.Filter = Filter;
})();