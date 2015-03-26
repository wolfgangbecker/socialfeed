(function() {

  function Category() {
    console.debug(this.constructor.name + ': instance CREATED');
    this.configure();
  };

  Category.prototype.configure = function() {
    this.ui = {};
    this.ui.form_container = '.js-category-form-container';
    this.ui.list_container = '.js-categories-list-container';
  }

  Category.prototype.refresh_form = function($form) {
    var category = this;
    $(category.ui.form_container).fadeOut("slow", function() {
      $(category.ui.form_container).html($form);
      (new App()).apply_tagsinput();
      $(category.ui.form_container).fadeIn('slow');
    });
  };

  Category.prototype.refresh_list = function($list) {
    var category = this;
    $(category.ui.list_container).fadeOut("slow", function() {
      $(category.ui.list_container).html($list);
      $(category.ui.list_container).fadeIn('slow');
      $('[data-toggle="tooltip"]').tooltip({html: true});
    });
  };

  window.Category = Category;
})();