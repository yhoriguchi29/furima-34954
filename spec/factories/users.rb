FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_kanji_last       {'田中'}
    name_kanji_first      {'花子'}
    name_furigana_last    {'タナカ'}
    name_furigana_first   {'ハナコ'}
    birth_date            {Faker::Date.backward}
  end
end