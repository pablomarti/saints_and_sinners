class Role < ActiveRecord::Base
  
  #has_and_belongs_to_many :admin_users, :join_table => :users_roles
  has_and_belongs_to_many :users, :class_name => "AdminUser", :join_table => :users_roles, :association_foreign_key => "user_id"

  
  belongs_to :resource, :polymorphic => true
  
  scopify
end
