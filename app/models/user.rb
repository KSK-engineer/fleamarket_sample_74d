class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address,     dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_many :items,      dependent: :destroy
  has_many :likes,      dependent: :destroy
  has_many :comments,   dependent: :destroy

  validates :nickname,           presence: true

  validates :email, uniqueness: true
  validates :password,  length: { minimum: 7 }
  validates :familyname_kanji,   presence: true, format: {with: /\A[^ -~｡-ﾟ]+\z/,}
  validates :firstname_kanji,    presence: true, format: {with: /\A[^ -~｡-ﾟ]+\z/,}
  validates :familyname_kana,    presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,} 
  validates :firstname_kana,     presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,} 
  validates :birthday,           presence: true

end
