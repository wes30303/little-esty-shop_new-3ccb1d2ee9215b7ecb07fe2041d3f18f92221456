class RemoveResultFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :result, :string
  end
end
