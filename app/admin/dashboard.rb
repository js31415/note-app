ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        div do
          h1 'Recent Notes' 
          Note.order(created_at: :desc).first(5).map do |note| 
            li link_to(note.title, admin_note_path(note))
          end
        end 
      end
      column do 
        div  do 
          h1 'Info'
          para 'Welcome to your notes application. It is powered by Ruby on Rails!'
        end
      end
    end
    
    columns do 
      column do
        div do
          h1 'Your Subjects'
          Subject.order(name: :asc).map do |subject|
            li link_to(subject.name, admin_subject_path(subject))
          end
        end 
      end
    end
  

  end # content
end



