FactoryBot.define do
  #一般ユーザー
  factory :user do
    name {'user_name'} 
    phone_number {'09012345678'}
    email {'user@example.com'} 
    admin {'false'}
    password {'password'} 
    password_confirmation {'password'} 
  end
  #管理者ユーザー
  factory :second_user, class: User do
    name {'admin_name'} 
    phone_number {'09098765432'}
    email {'admin@example.com'} 
    admin {'true'}
    password {'adminpassword'} 
    password_confirmation {'adminpassword'} 
  end
end