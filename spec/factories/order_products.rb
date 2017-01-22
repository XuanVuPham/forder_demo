FactoryGirl.define do
  factory :order_product do
    quantity {Faker::Number.between(1, 10)}
    product {FactoryGirl.create(:product)}
  end
end
