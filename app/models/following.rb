class Following < ActiveRecord::Base

  fields do
    timestamps
  end

  attr_protected

  belongs_to :user
  belongs_to :followed, class_name: 'User'

end
