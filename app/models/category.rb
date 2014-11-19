class Category < ActiveRecord::Base

  #
  # schema
  #
  fields do
    name        :string
    tags        :string
    description :text
    editable    :boolean, default: true
    timestamps
  end

  attr_accessible :name, :tags, :description, :editable, :user_id

  #
  # Validations
  # 

  #
  # Relations
  # 
  has_many   :feeds
  belongs_to :user
  #
  # Methods
  # 

end
