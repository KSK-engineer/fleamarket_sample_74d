class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :credit_card, dependent: :destroy
  has_many :addresses,  dependent: :destroy
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

  # validates :password, length: { minimum: 7 }

  VALID_EMAIL_REGEX = /[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+/
  validates :email, format: { with: VALID_EMAIL_REGEX}

  #名字に漢字とひらがなを使えるように正規表現を設定
  VALID_LASTNAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :familyname_kanji, format: { with: VALID_LASTNAME_REGEX}

  #名前に漢字とひらがなを使えるように名字から正規表現を参照している
  VALID_FIRSTNAME_REGEX = VALID_LASTNAME_REGEX
  validates :firstname_kanji, format: { with: VALID_FIRSTNAME_REGEX}

  #名字のフリガナにカタカナを使えるように正規表現を設定
  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :familyname_kana, format: { with: VALID_LASTNAMEKANA_REGEX}

  #名前のフリガナにカタカナを使えるように名字のフリガナから正規表現を参照している
  VALID_FIRSTNAMEKANA_REGEX = VALID_LASTNAMEKANA_REGEX
  validates :firstname_kana, format: { with: VALID_FIRSTNAMEKANA_REGEX}

end
