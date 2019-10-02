50.times do |n|
  email = Faker::Internet.email
  full_name = Faker::Name.name
  user_name = Faker::Name.middle_name
  password = "password"
  image = open("#{Rails.root}/db/fixtures/no_image.png")
  User.create!(
    email: email,
    full_name: full_name,
    user_name: user_name,
    password: password,
    password_confirmation: password,
    image: image,
    )
end