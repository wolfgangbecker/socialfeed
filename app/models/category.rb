class Category < ActiveRecord::Base

  #
  # schema
  #
  fields do
    name        :string
    tags        :string
    description :text
    timestamps
  end

  attr_accessible :name, :tags, :description

  #
  # Validations
  # 

  #
  # Relations
  # 
  has_many   :channels
  belongs_to :user
  #
  # Methods
  # 

end
