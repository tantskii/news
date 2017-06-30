class AddUniqIndexesToIntUser < ActiveRecord::Migration[5.0]
  def change
    add_index :interest_users, [:user_id, :interest_id], unique: true
  end
end
