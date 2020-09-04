class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :credit_card, dependent: :destroy
  has_many :addresses,   dependent: :destroy
  has_many :likes,      dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :items,      dependent: :destroy

  validates :nickname,           presence: true
  validates :familyname_kanji,   presence: true
  validates :firstname_kanji,    presence: true
  validates :familyname_kana,    presence: true
  validates :firstname_kana,     presence: true
  validates :birthday,           presence: true

  validates :email, uniqueness: true

  validates :nickname,         length: { maximum: 10 }
  validates :password,         length: { minimum: 7 }
  validates :familyname_kanji, length: { maximum: 10 }
  validates :firstname_kanji,  length: { maximum: 10 }
  validates :familyname_kana,  length: { maximum: 10 }
  validates :firstname_kana,   length: { maximum: 10 }

  #ニックネームにひらがな・カタカナ・漢字・半角英数を使えるように正規表現を設定
  VALID_NICKNAME_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z0-9.!]/
  validates :nickname, uniqueness: true, format: { with: VALID_NICKNAME_REGEX}, on: :create

  #名字に漢字とひらがなを使えるように正規表現を設定
  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :familyname_kanji, format: { with: VALID_LASTNAME_REGEX}

  #名前に漢字とひらがなを使えるように名字から正規表現を参照
  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname_kanji, format: { with: VALID_FIRSTNAME_REGEX}

  #名字のフリガナにカタカナを使えるように正規表現を設定
  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :familyname_kana, format: { with: VALID_LASTNAMEKANA_REGEX}

  #名前のフリガナにカタカナを使えるように名字のフリガナから正規表現を参照している
  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana, format: { with: VALID_FIRSTNAMEKANA_REGEX}

end
