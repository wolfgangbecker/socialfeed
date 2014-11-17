class SavedArticle < ActiveRecord::Base
  #
  # schema
  #
  fields do
    title       :string
    url         :string
    description :text
    timestamps
  end
  
  attr_accessible :title, :url, :description

  #
  # Validations
  # 

  #
  # Relations
  # 
  belongs_to :channel
  #
  # Methods
  # 
end
