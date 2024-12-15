require 'json'

module Update
    class UpdateNote
        def initialize(id , title, content,user)
           @id = id.to_i
           @title = title
           @content = content
           @userName= user['name']
           @password = user['password']
        end        
        def update_note
            @data = UData::Info.new.user_information
                @data.each do |user|
                    if(user['name']==@userName)
                        ud = user['notes']
                        ud.each do |u|
                            if u["index"].eql?(@id)
                               u['title']=@title
                               u['content']=@content
                            end
                        end
                    end
                end
            File.open("User_info.json",'w') do |file|
                file.write(JSON.pretty_generate(@data))
             end 
        end
    end
    
end

# obj = Update::UpdateNote.new(1,"Meeting Notes","Discussed project roadmap",subhi)
#   obj.update_note