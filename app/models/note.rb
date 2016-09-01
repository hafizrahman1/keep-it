class Note < ActiveRecord::Base
  belongs_to :user
  has_many :note_topics
  has_many :topics, through: :note_topics
end
