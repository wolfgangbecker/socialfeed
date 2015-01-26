(function() {

  function Entry() {
    console.debug(this.constructor.name + ': instance CREATED');
    this.configure();
  };

  Entry.prototype.configure = function() {
    this.ui = {};
    this.ui.entries = '.js-entries';
    this.ui.entry = '.js-entry';
    this.ui.read_link = '.js-read-link';
    this.ui.favorite_link = '.js-favorite-link';
    this.ui.add_button = '#add-feed-modal';
    this.ui.category_form = '.js-category-form';
    this.ui.search_form = '.js-entries-search-form';
  }

  // Manage Category select
  Entry.prototype.initiate_category_select = function() {
    $(this.ui.category_form).on('change', 'select', function(){
      $(this).closest('form').submit();
    });
  };

  // refresh entries search form
  Entry.prototype.refresh_search_form = function($form) {
    var entry = this;
    $(entry.ui.search_form).fadeOut("slow", function() {
      $(entry.ui.search_form).html($form);
      $(entry.ui.search_form).fadeIn('slow');
      $('select').select2();
    });
  };

  // refresh entries
  Entry.prototype.refresh_entries = function($entries) {
    var entry = this;
    $(entry.ui.add_button).modal('hide');
    $(entry.ui.entries).fadeOut("slow", function() {
      $(entry.ui.entries).html($entries);
      $(entry.ui.entries).fadeIn('slow');
    });
  };

  window.Entry = Entry;
})();