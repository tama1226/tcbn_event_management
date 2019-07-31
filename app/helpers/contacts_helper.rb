module ContactsHelper
  #以下のアクション時に確認画面を挟むようにするヘルパーメソッド
  def choose_new
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_contacts_path
    end
  end
end
