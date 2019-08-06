require 'rails_helper'

RSpec.feature "User機能関連", type: :feature do
  background do
    #あらかじめテストデータを登録
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
  end

  context '一般ユーザーのログイン' do 
    before do
      visit new_user_session_path

      fill_in "メールアドレス", with: 'user@example.com'
      fill_in "パスワード", with: 'password'

      click_on 'Log in'
      expect(page).to have_content 'ログインしました。'
    end

    scenario "プロフィール欄のテスト" do
      visit user_path(@user1)

      expect(page).to have_content 'user_name'
      expect(page).to have_content '09012345678'
      expect(page).to have_content 'user@example.com'
      save_and_open_page
    end

    scenario "ログアウトのテスト" do
      click_on 'ログアウト！'

      expect(page).to have_content 'ログアウトしました。'
    end
  end

  context '管理者ユーザーのログイン' do 
    before do
      visit new_user_session_path

      fill_in "メールアドレス", with: 'admin@example.com'
      fill_in "パスワード", with: 'adminpassword'

      click_on 'Log in'
      expect(page).to have_content 'ログインしました。'
    end

    scenario "プロフィール欄のテスト" do
      visit user_path(@user2)

      expect(page).to have_content 'admin_name'
      expect(page).to have_content '09098765432'
      expect(page).to have_content 'admin@example.com'
      save_and_open_page
    end

    scenario "ログアウトのテスト" do
      click_on 'ログアウト！'

      expect(page).to have_content 'ログアウトしました。'
    end
  end
end