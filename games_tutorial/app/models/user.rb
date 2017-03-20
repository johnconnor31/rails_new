class User < ApplicationRecord
  attr_accessor :password
  validates_uniqueness_of :name
  validates_presence_of :name
  before_save :encrypt_pwd
  def self.authenticate(name , password)
    user = find_by_name(name)
    if  user 
      user
    else 
       nil
    end
  end
  private 
  def encrypt_pwd
  self.password_salt = BCrypt:: Engine.generate_salt
  self.password_hash = BCrypt:: Engine.hash_secret(:password, self.password_salt)
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider,uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
