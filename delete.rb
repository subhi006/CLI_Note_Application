require 'json'

module Delete
    class DeleteNote
        def initialize(id,user)
            @userName = user['name']
            @note = user['notes']
            @id = id.to_i 
        end
        def dNote
                @data = UData::Info.new.user_information
                @data.each do |user|
                    if(user['name']==@userName)
                        userNote = user['notes']
                        if userNote.empty?
                            puts "There is no Note!"
                            return
                        else
                            userNote.each do |note|
                                if note["index"].eql?(@id)
                                   note.clear
                                elsif note["index"]> @id
                                  note["index"]=note["index"]-1
                                end
                             end
                         end
                         userNote.delete_if{|d| d.empty?}
                     end
                    File.open("User_info.json",'w') do |file|
                        file.write(JSON.pretty_generate(@data))
                     end  
                end
             puts "Note Deleted successfully!"
        end
    end
end