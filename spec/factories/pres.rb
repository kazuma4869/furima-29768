FactoryBot.define do
  factory :pre do
    house_code              {"666-6666"}
    prefecture_id           {"2"}
    city                    {"丸々市"}
    house_address           {"000"}
    telephone               {"00000000000"}
    token                   {"tok_abcdefghijk00000000000000000"}
    association :management
  end
end
