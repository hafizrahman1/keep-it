class Topic < ActiveRecord::Base
	has_many :note_topics
	has_many :notes, through: :note_topics
end