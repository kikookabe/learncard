5.times do |n|
   User.create!(
     name: "user#{n + 10}",
     email: "user#{n + 10}@user.com",
     password: "qqqq1234#{n + 1}", 
     password_confirmation: "qqqq1234#{n + 1}"
   )
end

5.times do |n|
  Task.create!(
    title: "化学テキスト#{n + 1}",
    user_id: "1",
    start_date: DateTime.strptime("07/13/2022 8:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("07/14/2022 8:00", "%m/%d/%Y %H:%M"),
    comment: "テキストは難しいが理解できた",
    advise: "よくできました！この調子！"
  )
end

User.create!(name: "kanrisya", email: "kanrisya@kanrisya.com", password: "qqqq1234", password_confirmation: "qqqq1234", admin: true)