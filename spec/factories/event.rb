FactoryBot.define do

  factory :event do
    name {'test_name'} 
    kind {'イベント'}
    start_on {'2019-08-06'} 
    price {'2000'} 
    game {'5'} 
    lane {'35'}
  end
end