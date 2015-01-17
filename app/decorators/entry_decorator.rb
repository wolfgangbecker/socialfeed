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

  def id
    object.id
  end

  def read
    object.read ? Entry.human_attribute_name(:read) : Entry.human_attribute_name(:unread)
  end
end
