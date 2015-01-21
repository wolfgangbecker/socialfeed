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

  Entry.prototype.inititate_buttons = function() {  
    var entry = this;
    // Manage entry buttons
    $(entry.ui.entries)
    .on('ajax:success', entry.ui.entry, function(e, data){
      // Read/Unread switch
      if(data.read){
        $(this).addClass('read');
        $(this).find(entry.ui.read_link).text('Read');
        $(this).find(entry.ui.read_link).attr('href', $(this).find(entry.ui.read_link).attr('href').replace('read%5D=true', 'read%5D=false'));
      }
      else{
        $(this).removeClass('read');
        $(this).find(entry.ui.read_link).text('Unread');
        $(this).find(entry.ui.read_link).attr('href', $(this).find(entry.ui.read_link).attr('href').replace('read%5D=false', 'read%5D=true'));
      }
      // Favorite/Unfavorite
      if(data.favorite){ 
        $(this).find(this.ui.favorite_link).attr('href', $(this).find(this.ui.favorite_link).attr('href').replace('favorite%5D=true', 'favorite%5D=false'));
        $(this).find('.icon').addClass('favorited');
      }
      else{
        $(this).find(this.ui.favorite_link).attr('href', $(this).find(this.ui.favorite_link).attr('href').replace('favorite%5D=false', 'favorite%5D=true'));
        $(this).find('.icon').removeClass('favorited');
      }
    })
    .on('ajax:error', entry.ui.entry, function(e, data){
    });
  }

  Entry.prototype.inititate_dashboard = function() {
    // Manage entry submit button
    $(this.ui.add_button).on('click', '.js-add-feed', function(){
      $(this).closest('form').submit();
    });
    $(this.ui.add_button).on('keydown', '.form-control', function(e){
      if(e.which == 13){
        e.stopImmediatePropagation();
        $(this).closest('form').submit();
      }
    });
  };

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