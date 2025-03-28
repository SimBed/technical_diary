class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.date :date
      t.string :topic
      t.string :subtopic

      t.timestamps
    end
    add_index :items, :date
    add_index :items, :topic
    add_index :items, :subtopic
  end
end
