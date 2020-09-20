FactoryBot.define do
  factory :user_order do
    postal_code { 123 - 4567 }
    prefecture_id { 1 }
    city { '横浜市緑区' }
    addresses { '青山' }
    building_name { '柳ビル' }
    phone_number { 9_012_345_678 }
  end
end
