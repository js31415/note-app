ActiveAdmin.register Subject do
    permit_params :name, note_ids: []

    show title: "My Title" do 
      h3 'you have ' + pluralize(subject.notes.count, 'note') + ' for this subject'
      subject.notes.each do  |note|
        div do
          h1 note.title
          h4 link_to "[#{note.id}]: You created this note on #{note.created_at.strftime('%a %b %e %Y')}", admin_note_path(note)
        end
    end
  end
end
