FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    ship_charge_id { 2 }
    ship_area_id { 2 }
    ship_date_id { 2 }
    sales_price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
