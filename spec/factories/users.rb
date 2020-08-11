FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email {Faker::Internet.free_email}
    password              {"0a000000"}
    password_confirmation {"0a000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana         { "ヤマダ" }
    first_name_kana        { "タロウ" }
    birth_year         { 2020 }
    birth_month        { 1 }
    birth_day          { 1 }
  end
end