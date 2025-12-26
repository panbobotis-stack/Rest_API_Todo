class User < ApplicationRecord
  # Κρυπτογράφηση κωδικού
  has_secure_password

  # Συσχέτιση με τα Todos χρησιμοποιώντας το created_by
  has_many :todos, foreign_key: :created_by

  # Validations
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
end