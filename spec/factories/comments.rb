FactoryGirl.define do
  factory :comment do
    content "MyText"
    user nil
    commentable_id 1
    commentable_type "MyString"
  end
end
