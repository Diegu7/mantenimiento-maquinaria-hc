namespace :users do
  desc 'Generates admin user'
  task generate_admin: :environment do
    user = User.new(
      username: 'admin',
      first_name: 'Administrador',
      last_name: 'Honducaribe',
      email: 'admin@honducaribe.com',
      password: 'admin',
      password_confirmation: 'admin'
    )

    puts 'Failed to create admin user' unless user.save
  end
end
