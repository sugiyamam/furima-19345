FactoryBot.define do

  factory :item do
    name                   {"あカ阿"}
    description            {"あア阿"}
    category_id            {1}
    status_id              {1}
    delivery_price_id      {1}
    prefecture_id          {1}
    delivery_time_id       {1}
    price                  {300}
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_images/test_image.jpeg'), filename: 'test_image.png')
    end
  end
end