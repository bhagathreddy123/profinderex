FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { "Password@123"}
    contact_number { Faker::PhoneNumber.cell_phone_with_country_code }
    country { User.country_code_list.sample }
    state { 'AP' }
    city { 'Kurnool' }
  end
end
