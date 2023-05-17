FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '次郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'ジロウ' }
    birth_day { Faker::Date.birthday }
  end
end
