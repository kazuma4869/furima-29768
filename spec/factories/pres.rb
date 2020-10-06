FactoryBot.define do
  factory :item do
    house_code              {"666-6666"}
    prefecture_id           {"2"}
    city                    {"大川市"}
    house_address           {"000"}
    telephone               {"000-0000-0000"}
    association :management
  end
end
