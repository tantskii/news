class CreateInformationSources < ActiveRecord::Migration[5.0]
  def change
    create_table :information_sources do |t|
      t.string :rss
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
