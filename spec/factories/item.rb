FactoryBot.define do

  factory :item do
    name              {"アイテム"}
    detail            {"詳細"}
    condition         {"良い"}
    shipping_cost     {"着払い"}
    shipping_method   {"ゆうパック"}
    shipping_source   {"東京都"}
    delivery_date     {"1日〜2日"}
    shopping_status   {"1"}
    price             {"1000"}
    tax               {"100"}
    profit            {"900"}
    status            {"1"}
    category_id       {"1"}
    user_id           {"1"}
    brand_id          {"1"}
    size_id           {"1"}
  end

end