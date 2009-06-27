class User < ActiveRecord::Base
  generator_for :login => "bobby"
  generator_for :password => 'bobby'
  generator_for :password_confirmation => 'bobby'
  generator_for :first_name => 'Bob'
  generator_for :last_name => 'Dobbs'
  generator_for :email => 'BobDobbs@example.com'
end
