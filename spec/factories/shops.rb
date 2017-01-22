FactoryGirl.define do
  factory :shop do
    name {Faker::Name.name}
    description {Faker::Hacker.say_something_smart}
    status 1
    users {[FactoryGirl.create(:user)]}
  end
end
