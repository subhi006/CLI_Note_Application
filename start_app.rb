require_relative "Register.rb"
require_relative "Login.rb"

class Start
    include Register
    include Login
    def menu
        while(true)
            puts "
                 || CLI Note Application ||
                 
            Please choose an option:
            1. Register
            2. Login
            3. Exit"
            print "Enter option number:"
            num = gets.chomp.to_i
            case num
            when 1
                print "Enter username:"
                name=(gets.chomp)
                print "Enter password:"
                password=(gets.chomp)
                user = Register::User.new(name,password)
                user.user_Register
            when 2
                print "Enter username:"
                name=gets.chomp
                print "Enter password:"
                pass=gets.chomp
                userinfo = Login::User_login.new(name,pass)
                userinfo.check
            when 3 
              puts "Goodbye!"
              return
            else
                puts "Invalid option. Please choose again."
            end
            puts "Enter any key!"
            gets 
        end
    end
end

start = Start.new 
start.menu
