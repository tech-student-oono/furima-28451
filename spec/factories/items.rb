FactoryBot.define do
  factory :item do
    item_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'testimage/sample1.png')) }
    item_name { 'あああ' }
    item_info { 'あああ' }
    category_id { 1 }
    status_id { 1 }
    fee_id { 1 }
    prefecture_id { 1 }
    scheduled_id { 1 }
    item_price { 500 }
  end
end
