class Category < ActiveRecord::Base
  acts_as_tenant :user
  before_destroy :check_if_editable
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
  protected
    def check_if_editable
      raise I18n.t('errors.can_not_be_destroyed') unless editable
    end
end
