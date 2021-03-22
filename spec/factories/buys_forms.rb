FactoryBot.define do
  factory :buys_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '横浜市緑区' }
    house_number { '青山1-1-1' }
    building_name { '' }
    phone_number { '09012345678' }
  end
end
