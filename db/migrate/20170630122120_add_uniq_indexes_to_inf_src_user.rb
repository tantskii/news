class AddUniqIndexesToInfSrcUser < ActiveRecord::Migration[5.0]
  def change
    add_index :information_source_users, [:user_id, :information_source_id],
              unique: true,
              name: 'index_inf_src_users_on_user_id_and_information_source_id'

  end
end
