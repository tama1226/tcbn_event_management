require 'rails_helper'

RSpec.feature "イベント管理機能", type: :feature do
  background do
    #あらかじめテストデータを登録
    @event1 = FactoryBot.create(:event)
  end

  scenario "イベント一覧(index)のテスト" do
    #イベント日程のページへ遷移
    visit events_path

    expect(page).to have_content 'test_name'
    expect(page).to have_content 'イベント'
    expect(page).to have_content '2000円'
    expect(page).to have_content '35レーン'
  end

  scenario "イベント新規登録(new)のテスト" do
    #イベント新規登録ページへ
    visit new_event_path

    fill_in "イベント名", with: 'test_name'
    select 'イベント', from: '種類'
    fill_in "料金", with: '2000'
    select '3', from: 'ゲーム数'
    fill_in "レーン数", with: '36'

    click_on '登録する'

    expect(page).to have_content 'test_name'
    expect(page).to have_content 'イベント'
    expect(page).to have_content '2000円'
    expect(page).to have_content '36レーン'
  end

  scenario "イベント詳細(show)のテスト" do
    #イベントの詳細（テストデータ）ページへ
    visit event_path(@event1)

    expect(page).to have_content 'test_name'
    expect(page).to have_content 'イベント'
    expect(page).to have_content '2000'
    expect(page).to have_content '35'  
  end

  scenario "イベント更新(update)のテスト" do
    #イベントの更新（テストデータ）ページへ
    visit edit_event_path(@event1)

    fill_in "イベント名", with: 'test1_name'
    select '予約', from: '種類'
    fill_in "料金", with: '2500'
    select '4', from: 'ゲーム数'
    fill_in "レーン数", with: '18'

    click_on '更新する'

    expect(page).to have_content 'test1_name'
    expect(page).to have_content '予約'
    expect(page).to have_content '2500'
    expect(page).to have_content '18'
  end

  scenario "イベント検索のテスト" do

    visit events_path

    fill_in "イベント名", with: 'test'

    click_on '検索'

    expect(page).to have_content 'test_name'
  end
end