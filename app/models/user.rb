class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_kanji_last, presence: true
  validates :name_kanji_first, presence: true
  validates :name_furigana_last, presence: true
  validates :name_furigana_first, presence: true
  validates :birth_date, presence: true
end
