class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :pub_date
      t.string :photo

      t.timestamps
    end
  end
end