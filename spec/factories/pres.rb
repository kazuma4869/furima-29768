FactoryBot.define do
  factory :pres do
    house_code              {"666-6666"}
    prefecture_id           {"2"}
    city                    {"丸々市"}
    house_address           {"000"}
    telephone               {"00000000000"}
    price                   {3000}
    token                   {"tok_abcdefghijk00000000000000000"}
    association :management
  end
end
