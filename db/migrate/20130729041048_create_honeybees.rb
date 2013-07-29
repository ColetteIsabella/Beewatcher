class CreateHoneybees < ActiveRecord::Migration
  def change
    create_table :honeybees do |t|
      t.string :name
      t.string :description
      t.string :location
      t.references :user_id
      t.timestamps
    end
  end
end
