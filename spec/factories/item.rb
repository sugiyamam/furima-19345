FactoryBot.define do

  factory :item do
    name                   {"あカ阿"}
    description            {"あア阿"}
    category_id            {2}
    status_id              {2}
    delivery_price_id      {2}
    prefecture_id          {2}
    delivery_time_id       {2}
    price                  {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.png')
    end
  end
end