require 'rails_helper'

RSpec.describe Event, type: :model do

  it "必須項目の内容が記載されていれば、バリデーションが通る" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: '35')
    expect(event).to be_valid
  end

  it "nameが空ならバリデーションが通らない" do
    event = Event.new(name: ' ', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "nameが30文字より多いとバリデーションが通らない" do
    event = Event.new(name: 'qwertyuiopasdfghjklzxcvbnmzxcvbnm', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "kindが空ならバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: ' ', start_on: '2019-08-06', price: '2000', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "start_onが空ならバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: ' ', price: '2000', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "priceが空ならバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: ' ', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "priceが半角英数字でないとバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2千円', game: '5', lane: '35')
    expect(event).not_to be_valid
  end

  it "gameが空ならバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: ' ', lane: '35')
    expect(event).not_to be_valid
  end

  it "laneが空ならバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: ' ')
    expect(event).not_to be_valid
  end

  it "laneが半角英数字でないとバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: '35レーン')
    expect(event).not_to be_valid
  end

  it "laneが36より多い値だとバリデーションが通らない" do
    event = Event.new(name: 'test_name', kind: 'イベント', start_on: '2019-08-06', price: '2000', game: '5', lane: '40')
    expect(event).not_to be_valid
  end
end