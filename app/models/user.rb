class User < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email

  devise :database_authenticatable, :omniauthable

  attr_accessible :name, :email, :encrypted_password

  def self.find_for_facebook_oauth(omniauth)
    user_data = omniauth['extra']['user_hash']

    if user = User.find_by_email(user_data['email'])
      user
    else
      User.create!(:name => user_data['name'],
                   :email => user_data['email'],
                   :encrypted_password => Devise.friendly_token[0,20]
                  )
    end
  end
end
