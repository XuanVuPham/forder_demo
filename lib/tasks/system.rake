namespace :system do
  desc "TODO"
  task create_admin: :environment do
    Admin.create!(email: "admin@gmail.com",
                 password: "123456",
                 password_confirmation: "123456")
  end

end
