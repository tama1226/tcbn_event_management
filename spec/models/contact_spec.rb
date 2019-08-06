require 'rails_helper'

RSpec.describe Contact, type: :model do

  it "必須項目の内容が記載されていれば、バリデーションが通る" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).to be_valid
  end

  it "reserved_nameが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: ' ', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "reserved_nameが30文字より多いとバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'qwertyuiopasdfghjklzxcvbnmzxcvbnm', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "nameが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: ' ', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "nameが20文字より多いとバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'qwertyuiopasdfghjklzxcvbnm', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "phone_numberが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: ' ', email: 'test@example.com', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: '09012345678', email: ' ', number_of_people: '10', lane: '35')
    expect(contact).not_to be_valid
  end

  it "number_of_peopleが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: ' ', lane: '35')
    expect(contact).not_to be_valid
  end

  it "number_of_peopleが半角英数字でないとバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: '十人', lane: '35')
    expect(contact).not_to be_valid
  end

  it "laneが空ならバリデーションが通らない" do
    contact = Contact.new(reserved_name: 'test_name1', name: 'test_name2', phone_number: '09012345678', email: 'test@example.com', number_of_people: '10', lane: ' ')
    expect(contact).not_to be_valid
  end
end