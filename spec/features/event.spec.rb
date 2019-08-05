require 'rails_helper'

RSpec.feature "イベント管理機能", type: :feature do

  scenario "イベント一覧のテスト" do
    Event.create!(name: 'test_event',
                  kind: '予約',
                  start_on: '2019-08-05',
                  price: '3000',
                  game: '5',
                  lane: '35')
    #イベント一覧ページに遷移
    visit events_path

    expect(page).to have_content 'test_event'
    expect(page).to have_content '予約'
    expect(page).to have_content '2019年08月05日'
    expect(page).to have_content '00時00分'
    expect(page).to have_content '3000円'
    expect(page).to have_content '35レーン'
  end

  scenario "イベント新規登録のテスト" do
    #イベント登録画面に遷移
    visit new_event_path

    fill_in 

    click_on



    save_and_open_page

  end

  scenario "イベント詳細のテスト" do

  end
end
