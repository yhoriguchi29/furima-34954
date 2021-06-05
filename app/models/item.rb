class Item < ApplicationRecord
  belongs_to :user
  has_one :order
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
    validates :sales_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                            message: 'is invalid' }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :ship_charge_id
      validates :ship_area_id
      validates :ship_date_id
    end
  end
end
