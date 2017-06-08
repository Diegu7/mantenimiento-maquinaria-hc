class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :first_name, :last_name, :email
  validates_uniqueness_of :username

  mount_uploader :avatar, UserImageUploader

  def full_name
    first_name << ' ' << (middle_name || '') << ' ' << last_name
  end
end
