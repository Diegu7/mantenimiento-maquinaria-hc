require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { build :user }
  let(:user_without_username) { build :user, username: nil }
  let(:user_without_first_name) { build :user, first_name: nil }
  let(:user_without_middle_name) {build :user, middle_name: nil }
  let(:user_without_last_name) { build :user, last_name: nil }
  let(:user_without_email) { build :user, email: nil }
  let(:user_wihtout_image) { build :user, image: nil }
  let(:user_without_password) { build :user, password: nil }

  it "is valid with name, username, first name, last name, email, and password" do
    expect(valid_user).to be_valid
  end
  
  it "is valid without a middle name" do
    expect(user_without_middle_name).to be_valid
  end
  
  it "is valid without an image" do
    expect(user_wihtout_image).to be_valid
  end

  it "is invalid without a username" do
    user_without_username.valid?
    expect(user_without_username.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a first name" do
    user_without_first_name.valid?
    expect(user_without_first_name.errors[:first_name]).to include("can't be blank")
  end
  
  it "is invalid without a last name" do
    user_without_last_name.valid?
    expect(user_without_last_name.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user_without_email.valid?
    expect(user_without_email.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user_without_password.valid?
    expect(user_without_password.errors[:password]).to include("can't be blank")
  end
  
end 
