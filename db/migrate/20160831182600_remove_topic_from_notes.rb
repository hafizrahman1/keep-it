class RemoveTopicFromNotes < ActiveRecord::Migration
  def change
  	remove_column :notes, :topic
  end
end
