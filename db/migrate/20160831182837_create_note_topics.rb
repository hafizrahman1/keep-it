class CreateNoteTopics < ActiveRecord::Migration
  def change
  	create_table :note_topics do |t|
  	  t.integer :note_id
  	  t.integer :topic_id
  	end
  end
end
