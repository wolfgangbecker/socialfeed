require 'feed_validator'

class FeedUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    v ||= W3C::FeedValidator.new
    begin
      v.validate_url(value)
    rescue Exception => e
    end
    unless v.valid?
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.invalid_feed_url'))
    end
  end
end