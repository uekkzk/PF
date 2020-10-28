# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create!(
  [
    {name: "ぴょんす", email: "pyonsu@gmail.com", password: "pyonsu"},
    {name: "ぴょんす2", email: "pyonsu2@gmail.com", password: "pyonsu2"}
  ]
)

Parking.create!(
  [
    {user_id: 1, parking_name: "ぴょんすパーキング", prefecture_code: 27, address: "通天閣", regular_holiday: "年中無休", fee: "3時間100円"}
  ]
)