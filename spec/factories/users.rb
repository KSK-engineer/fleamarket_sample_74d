FactoryBot.define do

  factory :user do
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    familyname_kanji      {"山田"}
    firstname_kanji       {"太郎"}
    familyname_kana       {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday              {"2020-01-01"}
  end

end