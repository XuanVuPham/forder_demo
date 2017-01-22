FactoryGirl.define do
  factory :event do
    eventable_type "MyString"
    eventable_id 1
    read false
    user nil
  end
end
