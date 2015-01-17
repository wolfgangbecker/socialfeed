module CategoriesHelper
  def category_title category
    title = ''
    title += I18n.t('categories.index.description') + ": #{category.description}\n" unless category.description.blank?
    title += I18n.t('categories.index.tags') + ": #{category.tags}\n" unless category.tags.blank?
    title.chomp
  end
end
