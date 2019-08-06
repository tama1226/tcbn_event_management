require 'rails_helper'

RSpec.feature "お問い合わせ機能", type: :feature do
  
  scenario "予約の新規問い合わせのテスト" do
    #予約お問い合わせページへ
    visit new_contacts_path

    fill_in "ご予約名", with: 'test_name'
    fill_in "代表者名", with: 'test_name'
    fill_in "お電話番号", with: '09012345678'
    fill_in "メールアドレス", with: 'example@example.com'
    fill_in "人数", with: '10'
    fill_in "レーン数", with: '36'

    click_on '確認画面へ'
    click_on '送信'

    expect(page).to have_content 'メールが送信されました！'
  end
end