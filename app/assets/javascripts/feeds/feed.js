(function() {

  function Feed() {
    console.debug(this.constructor.name + ': instance CREATED');
    this.configure();
  };

  Feed.prototype.configure = function() {
    this.ui = {};
    this.ui.add_button = '#add-feed-modal';
  }

  Feed.prototype.refresh_form = function($form) {
    // Manage entry submit button
    $(this.ui.add_button).find('.modal-content').html($form);
    $(this.ui.add_button).modal('show');
  };

  window.Feed = Feed;
})();