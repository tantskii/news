class CreateInterestUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_users do |t|

      t.timestamps
    end
  end
end
