class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  # schema
  #
  fields do
  	name 					          :string	
    notify_new_follower     :boolean, default: true
    notify_site_updates     :boolean, default: true
    notify_important_topics :boolean, default: true
  	email					          :string, default: "", null: false, index: "index_users_on_email", unique: true
  	encrypted_password		  :string, default: "", null: false
  	reset_password_token	  :string, index: "index_users_on_reset_password_token", unique: true
  	reset_password_sent_at  :datetime
  	remember_created_at		  :datetime
  	sign_in_count			      :integer, default: 0, null: false
  	current_sign_in_at		  :datetime
  	last_sign_in_at			    :datetime
  	current_sign_in_ip		  :string
  	last_sign_in_ip			    :string
  	remember_created_at 	  :datetime
  	created_at 				      :datetime, null: false
  	updated_at 				      :datetime, null: false
  end

  #
  # Validations
  # 

  #
  # Relations
  # 

  #
  # Methods
  # 

end
