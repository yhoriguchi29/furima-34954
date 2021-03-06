class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' } do
      validates :name_kanji_last
      validates :name_kanji_first
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :name_furigana_last
      validates :name_furigana_first
    end
    validates :nickname
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                        message: 'is invalid. Input both letters and numbers in half-width characters.' }
    validates :birth_date
  end

  has_many :items
  has_many :orders
end
