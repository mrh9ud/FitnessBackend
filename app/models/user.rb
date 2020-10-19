class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false, message: "Username %{value} is already taken", on: :create }
  validates :username, presence: { message: "Username must be present" }, on: :create
  validates :username, length: { in: 4..12, message: "Username must be between 4 and 12 characters" }
  validates :password, presence: { message: "Password must be present" }, on: :create
  validates :password, length: { in: 6..25, message: "Password must be between 6 and 25 characters" }
  validates :first_name, presence: { message: "First name must be present" }, on: :create
  validates :first_name, length: { in: 2..15, message: "First name must be between 2 and 15 characters" }, on: :create
  validates :last_name, presence: { message: "Last name must be present" }, on: :create
  validates :last_name, length: { in: 2..20, message: "Last name must be between 2 and 20 characters" }, on: :create
  validates :email, presence: { message: "Email must be present" }, on: :create
  validates :email, format: { with: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, multiline: true, on: :create }
end
