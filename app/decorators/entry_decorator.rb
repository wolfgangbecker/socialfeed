class EntryDecorator < Draper::Decorator
  delegate_all

  decorates_association :feed
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def feed_name
    object.feed.name || I18n.t('placeholders.untitled')    
  end
end
