class Following < ActiveRecord::Base
  acts_as_tenant :user
  #
  # schema
  #
  fields do
    timestamps
  end

  attr_protected

  #
  # Validations
  # 
  validates_uniqueness_to_tenant :followed_id

  #
  # Relations
  # 
  belongs_to :user
  belongs_to :followed, class_name: 'User'

end
