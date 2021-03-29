FactoryBot.define do
  factory :buys_form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '横浜市緑区' }
    house_number { '青山1-1-1' }
    building_name { '' }
    phone_number { '09012345678' }
    user_id {1}
    item_id {1}
  end
end
