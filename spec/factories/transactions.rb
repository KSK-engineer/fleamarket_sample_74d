FactoryBot.define do

  factory :transaction do
    id                    {1}
    item_id               {1}
    card_id               {1}
    buyer_id              {1}
    status                {0}
  end

end