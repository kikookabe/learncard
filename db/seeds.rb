5.times do |n|
   User.create!(
     name: "user#{n + 1}",
     email: "user#{n + 2}@user.com",
     password: "qqqq1234#{n + 1}", 
     password_confirmation: "qqqq1234#{n + 1}"
   )
end