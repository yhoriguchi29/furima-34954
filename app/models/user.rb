class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :name_kanji_last, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :name_kanji_first, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :name_furigana_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :name_furigana_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :birth_date
  end
end
