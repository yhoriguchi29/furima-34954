FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    ship_area_id    { 2 }
    city            { '横浜市緑区' }
    house_number    { '青山１−１−１' }
    building        { '' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
    user_id         { 10 }
    item_id         { 10 }
  end
end
