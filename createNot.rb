require 'json'
require_relative "jsonRead.rb"
# require_relative "Login.rb"

module Note 
    class CreateNote
        include UData
        def initialize(title,content,user_name)
            @title = title
            @content = content
            @user_name = user_name
            @index = 0
        end
        def create_note
            information = UData::Info.new.user_information
            userfound=false
            for user in information
                if user["name"].eql?(@user_name)
                    if user['notes'].size==0
                        @index = 1
                    else
                        @index = user['notes'].size+1
                    end
                    user['notes'] << { "index" => @index , "title" => @title, "content" => @content }
                    userfound = true
                    break
                end 
            end
            if userfound==false
                puts "user not found"
            end

            File.open('User_info.json', 'w') do |file|
               file.write(JSON.pretty_generate(information))
            end
        end
    end
end
# hii = Note::CreateNote.new("Meeting Notes", "Discussed project roadmap.", "subhi")
# hii.create_note
