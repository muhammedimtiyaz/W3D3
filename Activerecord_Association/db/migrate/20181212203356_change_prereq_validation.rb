class ChangePrereqValidation < ActiveRecord::Migration[5.1]
  def change
    change_column_null :prereqs, :name, true
  end
end
