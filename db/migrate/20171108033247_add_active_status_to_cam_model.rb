class AddActiveStatusToCamModel < ActiveRecord::Migration[5.1]
  def change
    add_column :cam_models, :active, :boolean
  end
end
