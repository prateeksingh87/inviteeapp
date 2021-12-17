class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_mail

  has_many :invites

  def send_mail
    NotificationMailer.send_signup_email(self).deliver_now
  end
  
  def generate_auth_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def custom_json
    return {
      id: id,
      email: email,
      created_at: created_at,
      updated_at: updated_at,
      auth_token: auth_token,
      first_name: first_name,
      last_name: last_name,
    }
  end

end
