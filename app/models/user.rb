class User < ActiveRecord::Base
  
  has_many :authentications, :dependent => :delete_all
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true

  def apply_omniauth(auth)	
  	tmp_password = generate_random(8)

  	tmp_username = auth['extra']['raw_info']['nickname'] rescue generate_random(6)
  	invalid_username = true
  	while invalid_username
  		tmp_user = User.find_by_username(tmp_username) rescue nil
  		if tmp_user.nil?
  			invalid_username = false
  		else
  			tmp_username = generate_random(6)
  		end
  	end

  	#Fields: first_name, last_name, email
  	self.email = auth['extra']['raw_info']['email']
  	self.username = tmp_username
  	self.password = tmp_password
  	self.password_confirmation = tmp_password
  	authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

  private
	  def generate_random(str_length)
	    charlist = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
	    generate_str = ""
	    1.upto(str_length) {|i| generate_str << charlist[rand(charlist.size-1)]}
	    return generate_str
	  end

end
