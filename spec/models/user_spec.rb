require 'rails_helper'

RSpec.describe User, type: :model do

  it "必須項目の内容が記載されていれば、バリデーションが通る" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end

  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: ' ', phone_number: '09012345678', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it "nameが30文字より多いとバリデーションが通らない" do
    user = User.new(name: 'qwertyuiopasdfghjklzxcvbnmzxcvbnm', phone_number: '09012345678', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it "phone_numberが10or11桁でないとバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '090123456789', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: ' ', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it "emailが書式に則っていないとバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: 'email', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it "passwordが空ならバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: 'test@example.com', password: ' ', password_confirmation: ' ')
    expect(user).not_to be_valid
  end

  it "passwordが6文字以上でないとバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: 'test@example.com', password: 'pass', password_confirmation: 'pass')
    expect(user).not_to be_valid
  end

  it "passwordとpassword_confirmationが一致してないとバリデーションが通らない" do
    user = User.new(name: 'user_name', phone_number: '09012345678', email: 'test@example.com', password: 'password1', password_confirmation: 'password2')
    expect(user).not_to be_valid
  end
end