FactoryBot.define do

  factory :item do
    id                    {1}
    name                  {"ライター"}
    detail                {"ライター"}
    prefecture_id         {1}
    condition             {1}
    delivery_fee          {1}
    delivery_day          {1}
    price                 {1000}
    seller_id             {5}
    brand_id              {1}
    category_id           {1}
  end

end