require 'json'

module Delete
    class DeleteNote
        def initialize(id,user)
            @userName = user['name']
            @note = user['notes']
            @id = id.to_i
            @data = UData::Info.new.user_information
                @data.each do |user|
                    if(user['name']==@userName)
                        ud = user['notes']
                        ud.each do |u|
                            if u["index"].eql?(@id)
                               u.clear
                            elsif u["index"]> @id
                               u["index"]=u["index"]-1
                            end
                        end
                       ud.delete_if{|d| d.empty?}
                    end
                end
            File.open("User_info.json",'w') do |file|
                file.write(JSON.pretty_generate(@data))
             end  
        end
    end
end