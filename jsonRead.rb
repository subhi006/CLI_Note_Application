require 'json'

module UData 
    class Info 
        def user_information
            if File.exist?('User_info.json') && !File.zero?("User_info.json")
                begin
                    file_content = File.read('User_info.json')
                    data=JSON.parse(file_content)
                rescue JSON::ParserError =>e
                    return[]
                end
            else
                []
            end
        end
    end
end
# UData::Info.new.user_information