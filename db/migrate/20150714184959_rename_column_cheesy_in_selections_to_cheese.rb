class RenameColumnCheesyInSelectionsToCheese < ActiveRecord::Migration
  def change
    rename_column :selections, :cheesy, :cheese
  end
end
