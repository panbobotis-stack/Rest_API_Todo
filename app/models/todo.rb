class Todo < ApplicationRecord
    # Σύνδεση με τα Items: Αν διαγραφεί το Todo, σβήνονται και τα Items του
    has_many :items, dependent: :destroy
    
    # Σύνδεση με τον User: Το Todo ανήκει σε έναν χρήστη (μέσω του created_by)
    belongs_to :user, foreign_key: :created_by
  
    # Έλεγχος ότι τα πεδία δεν είναι κενά
    validates_presence_of :title, :created_by
  end