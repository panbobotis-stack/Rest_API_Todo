class User < ApplicationRecord
    # Αυτό κρυπτογραφεί αυτόματα τον κωδικό
    has_secure_password
  
    # Σχέση: Ένας χρήστης έχει πολλά todos
    has_many :todos, foreign_key: :created_by
    
    validates_presence_of :name, :email, :password_digest
  end