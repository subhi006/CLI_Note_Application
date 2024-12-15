require 'json'
require_relative 'jsonRead.rb'
module Register

   class User

      attr_accessor :name,:password
      def initialize(name,password)
         @name = name
         @password = password
       end

      def user_Register
         users = information = UData::Info.new.user_information
         users.push({:name => @name,:password => @password, :notes => []})

         File.open("User_info.json",'w+') do |file|
            file.write(JSON.pretty_generate(users))
         end 
          puts "Hyy #{@name} Registration successful. Please log in."
      end
   end
end
# u = Register::User.new('skaj','jsjj')

# puts u.read
# u.user_Register

