FactoryBot.define do
  factory :item do
    item_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'testimage/sample1.png')) }
    item_name { 'あああ' }
    item_info { 'あああ' }
    item_price { 500 }
    association :user
  end
end
