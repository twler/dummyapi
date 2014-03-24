class Api::V1::UsersController < Api::V1::ApiController
  
  def index
    @users = []
    20.times do |n|
      name = Faker::Name.name
      @users << { 
        id: rand(1..100000),
        name: name,
        username: Faker::Internet.user_name(name, %w(. _ -)),
        email: Faker::Internet.email(name),
        created_at: rand(2.years).ago,
        company: {
          name: Faker::Company.name,
          tagline: Faker::Lorem.sentence(3, true),
          description: Faker::Lorem.sentence(20, true, 200)
        }
      }
    end
    respond_with @users
  end
  
end