FactoryGirl.define do
  factory :coupon do
    name "MyString"
    description "MyText"
    coupon_type 1
    discount_type 1
    value 1
    code "MyString"
    start_at "2016-09-15 09:11:41"
    end_at "2016-09-15 09:11:41"
  end
end
