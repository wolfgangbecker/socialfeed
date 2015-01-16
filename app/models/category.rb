class Category < ActiveRecord::Base
  acts_as_tenant :user
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
  validates :name, presence: true
  validates_uniqueness_to_tenant :name
  #
  # Scopes
  # 
  scope :undefined, -> { where(editable: false) }

  #
  # Relations
  # 
  has_many   :feeds, dependent: :destroy
  belongs_to :user
  #
  # Methods
  # 

end
