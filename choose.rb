require_relative "createNot.rb"
require_relative "viewNot.rb"
require_relative "Update.rb"
require_relative "delete.rb"
require_relative "NoteToPDF.rb"

module Choose 
    class Chose
        include Note 
        include Delete
        include Export
        def choose_list(user_name)
           while (true)
               puts "
               Please choose an option:
               1.Create Notes
               2.View Notes
               3.Update Notes
               4.Delete Notes
               5.Export Specific Note to PDF
               6.Exit"
                print "Enter option number:"
                n=gets.chomp.to_i
                case n
                #Note creation section
                when 1    
                  print "Enter note title :"
                  @title=gets.chomp 
                  print "Enter note content :"
                  @content=gets.chomp
                  @username=user_name['name']
                  note = Note::CreateNote.new(@title,@content,@username)
                  note.create_note
                  puts "Note created successfully"
                #Note view section
                when 2                 
                   @user= user_name
                   user_v=View::View_Note.new(@user)
                   user_v.note_view
                #Update section
                when 3                             
                    print "Enter note ID to Update : "
                    @id=gets.chomp
                    print "Enter new note title : "
                    @title=gets.chomp
                    print "Enter new note content : "
                    @content=gets.chomp
                    note = Update::UpdateNote.new(@id,@title,@content,user_name)
                    note.update_note
                    puts "Note updated successfully"
                #delet section
                when 4                    
                   print "Enter note ID to delete : "
                   idToDelete = gets()
                   Delete::DeleteNote.new(idToDelete,user_name)
                   puts "Note Deleted successfully!"
                #PDF section
                when 5
                   print "Enter note ID to export : "
                   idToUpdate = gets()
                   obj=Export::NotetoPDF.new(idToUpdate,user_name)
                   obj.toPDf
                   puts "NOte Exported to PDF successfully! The PDF has beed saved in your Downloads folder." 
                #exit section
                 when 6
                   puts "Goodbye!"
                   return
                end
                gets 
            end
        end

    end
end
# Choose::Chose.new.choose_list('subhi')