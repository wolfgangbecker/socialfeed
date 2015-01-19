module CategoriesHelper
  def category_title category
    title = ''
    title += I18n.t('categories.index.description') + ": #{category.description}<br>" unless category.description.blank?
    title += I18n.t('categories.index.tags') + ": #{category.tags}" unless category.tags.blank?
    title.chomp
  end
end
