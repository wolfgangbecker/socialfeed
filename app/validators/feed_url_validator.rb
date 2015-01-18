require 'feedjira'

class FeedUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    feed = Feedjira::Feed.fetch_and_parse value
    if feed.is_a? Fixnum
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.invalid_feed_url'))
    end
  end
end