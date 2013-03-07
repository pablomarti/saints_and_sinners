class AdminUser < ActiveRecord::Base

  rolify  
  #resourcify

  #has_and_belongs_to_many :roles, :join_table => :users_roles, :foreign_key => "user_id"
  has_many :user_roles, :foreign_key => :user_id
  has_and_belongs_to_many :roles, :class_name => "Role", :join_table => :users_roles, :foreign_key => :user_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :active
  attr_accessible :temporal_roles
  attr_accessor :temporal_roles
  
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true

  def get_roles
    @temporal_roles = roles.collect{ |role| role.name }.join(", ")
  end
  
end
