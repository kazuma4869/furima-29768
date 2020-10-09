FactoryBot.define do
  factory :item do
    name              {Faker::Name.name}
    explain           {"アイウエオ"}
    price             {"301"}
    category_id       {"2"}
    status_id         {"2"}
    fee_id            {"2"}
    prefecture_id     {"2"}
    shipment_id       {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
