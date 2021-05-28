class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_charge
  belongs_to :ship_area
  belongs_to :ship_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipCharge_id, numericality: { other_than: 1 }
    validates :shipArea_id, numericality: { other_than: 0 }
    validates :shipDate_id, numericality: { other_than: 1 }
    validates :sales_price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
  end
end
