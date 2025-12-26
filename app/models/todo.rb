class Todo < ApplicationRecord
    # Το todo ανήκει σε έναν χρήστη μέσω του created_by
    belongs_to :user, foreign_key: :created_by
    
    has_many :items, dependent: :destroy
    validates_presence_of :title, :created_by
  end