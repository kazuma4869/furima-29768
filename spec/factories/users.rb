FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    first_name            {Faker::Name.name}
    last_name             {Faker::Name.name}
    first_name_kana       {Faker::Name.name}
    last_name_kana        {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {"2020/4/1"}

  end
end