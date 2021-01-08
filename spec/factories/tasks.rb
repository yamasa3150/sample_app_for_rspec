FactoryBot.define do
  factory :task do
    sequence(:title, 'テストタイトル')
    content {'テスト文'}
    status { :todo }
    association :user
  end
end
