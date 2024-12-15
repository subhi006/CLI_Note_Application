# require_relative "Register.rb"
# require_relative "start_app.rb"
require_relative "jsonRead.rb"
require_relative "choose.rb"

module Login
    include UData
    include Choose
    class User_login
        def initialize(name,pass)
            @name = name
            @pass = pass
        end
        def check
          information = UData::Info.new.user_information
          flag=0
          for user in information
              if user['name']==(@name) && user['password']==(@pass)
                  puts "Login successful. Welcome, #{@name}!"
                  Choose::Chose.new.choose_list(user)
                  flag=1
                  break
              end
          end
          if flag==0
            puts "Invalid username or password"
          end
        end
    end
end
# Login::User_login.new("shloni","111").check