FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {"2020/4/1"}

  end
end