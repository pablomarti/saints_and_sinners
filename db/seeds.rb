if AdminUser.all.length == 0
	puts "Create Admin Users"

	admin_user = AdminUser.new(
		:username => "admin",
		:email => "admin@example.com",
		:password => "welcome123",
		:password_confirmation => "welcome123"
	)
	admin_user.save

	admin_user.add_role "admin"
end