FactoryBot.define do

  factory :address do
    family_name      {"山田"}
    given_name       {"太郎"}
    family_name_kana {"ヤマダ"}
    given_name_kana  {"タロウ"}
    postcode         {"111-1111"}
    prefecture       {"東京都"}
    city             {"渋谷区道玄坂"}
    block            {"1-9-5"}
    building         {"渋谷スクエアビル"}
    phone_number     {"000-0000-0000"}
  end

end