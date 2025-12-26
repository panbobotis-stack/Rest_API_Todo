class ChangeCreatedByToInteger < ActiveRecord::Migration[8.1]
  def change
    # Απλή αλλαγή τύπου χωρίς το USING CAST που μπερδεύει την SQLite
    change_column :todos, :created_by, :integer
  end
end