require 'json'
require_relative 'jsonRead.rb'
require "prawn"
module Export
    class NotetoPDF
        def initialize(id,user)
            @userName = user['name']
            @id = id.to_i
        end
        def toPDf
            flag=0
            @data = UData::Info.new.user_information
            @data.each do |user|
                if(user['name']==@userName)
                    ud = user['notes']
                    ud.each do |u|
                        if u["index"].eql?(@id)
                            @note = u
                            @titel = u['title']
                            flag=1
                            break
                        end
                    end
                end
            end
            if flag==0
                puts "Not does not exist or is empty."
            end
            
            Prawn::Document.generate("D:/Ruby/Ruby_Project1/UserInfo.pdf") do |pdf|
                pdf.text "Content", size: 20, style: :bold, align: :center
                pdf.move_down 20    
                pdf.text "Note No. : #{@note['index']}"
                pdf.text "Name : #{@userName}"
                pdf.text "Titel : #{@titel}"
                pdf.text "Content : #{@note['content']}"
                pdf.move_down 15    
            end
        end

    end
end

# Export::NotetoPDF.new(1,'subhi').toPDf