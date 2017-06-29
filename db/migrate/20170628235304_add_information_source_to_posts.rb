class AddInformationSourceToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :information_source, foreign_key: true
  end
end
