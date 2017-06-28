class ChangeInformationSourceUser < ActiveRecord::Migration[5.0]
  def change
    change_table :information_source_users do |t|
      t.belongs_to :information_source, index: true
      t.belongs_to :user, index: true
    end
  end
end
