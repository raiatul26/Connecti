class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:recoverable, 
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :recoverable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy       
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :friends, :through => :friendships
  accepts_nested_attributes_for :friends
  accepts_nested_attributes_for :friendships

  has_one_attached :image
  

  def self.from_omniauth(data)
  	user = User.find_by(email: data.email)

    if user.confirmed_at.blank?
      user.confirmed_at = Time.now
      user.save
    end

  	if user.blank?
  		user = User.create(
  			email: data.email,
  			password: SecureRandom.uuid[0,9],
        confirmed_at: Time.now
  			)
  	end

  	return user

  end

  def set_auth_token
    
    if self.auth_valid == false
      self.auth_token =  SecureRandom.uuid
      self.auth_valid = true
      self.save
    else
      self.save
    end  
  end

  # assignment
  def remove_auth_token_validity
    self.auth_valid = false
    self.save
  end








end
