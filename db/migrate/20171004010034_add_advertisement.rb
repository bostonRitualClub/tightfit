class AddAdvertisement < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :link, null: false
      t.string :name, null: false
    end
  end
end
