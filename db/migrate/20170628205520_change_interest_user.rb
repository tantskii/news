class ChangeInterestUser < ActiveRecord::Migration[5.0]
  def change
    change_table :interest_users do |t|
      t.belongs_to :interest, index: true
      t.belongs_to :user, index: true
    end
  end
end
