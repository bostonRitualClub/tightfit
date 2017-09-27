class AddVideoLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :link, null: false
      t.string :name, null: false
      t.jsonb :metadata
    end
  end
end
