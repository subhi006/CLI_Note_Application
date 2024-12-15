require 'json'

module View
    class View_Note
        def initialize(user)
            @user = user
        end

        def note_view
            note_v = @user['notes']
            note_index=0
            note_v.each do |note|
                puts "Note : #{note_index+1}"
                puts "Title : #{note['title']}"
                puts "Content : #{note['content']}"
                note_index+=1
            end
        end
    end
end
