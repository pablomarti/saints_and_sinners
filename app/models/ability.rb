class Ability
  include CanCan::Ability

  def initialize(admin_user)
  	admin_user ||= AdminUser.new

    if admin_user.has_role? :admin
    	can :manage, :all
    elsif admin_user.has_role? :admin_user_manager
    	can :manage, Role
    	can :manage, User
    elsif admin_user.has_role? :user_manager
    	can :manage, User    	
    end
  end

end
