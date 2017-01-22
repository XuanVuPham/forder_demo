FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    password_confirmation "123456"
    avatar {Faker::Name.name}
    chatwork_id {Faker::Name.name}
    description {Faker::Hacker.say_something_smart}
    email "user@gmail.com"
    password "123456"
    status 1
  end
  trait :admin do
    role {User.roles[:admin]}
  end
end
