class User < ApplicationRecord
  has_secure_password
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  before_create :confirmation_token

  validates :username, uniqueness: { case_sensitive: false, message: "Username %{value} is already taken", on: [:create, :update] }
  validates :username, presence: { message: "Username must be present" }, on: [:create, :update]
  validates :username, length: { in: 4..12, message: "Username must be between 4 and 12 characters" }
  validates :password, presence: { message: "Password must be present" }, on: [:update, :create]
  validates :password, length: { in: 6..25, message: "Password must be between 6 and 25 characters" }
  validates :first_name, presence: { message: "First name must be present" }, on: [:update, :create]
  validates :first_name, length: { in: 2..15, message: "First name must be between 2 and 15 characters" }, on: [:update, :create]
  validates :last_name, presence: { message: "Last name must be present" }, on: [:update, :create]
  validates :last_name, length: { in: 2..20, message: "Last name must be between 2 and 20 characters" }, on: [:update, :create]
  validates :email, presence: { message: "Email must be present" }, on: [:update, :create]
  validates :email, format: { with: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, multiline: true, on: [:update, :create] }

  def activate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end
  
  private

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
