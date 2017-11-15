class CreateCamModel < ActiveRecord::Migration[5.1]
  def change
    create_table :cam_models do |t|
      t.integer :age
      t.string :chat_room_url_revshare
      t.string :chat_room_url
      t.string :current_show
      t.string :gender
      t.string :image_url
      t.string :iframe_embed_revshare
      t.string :iframe_embed
      t.boolean :is_hd
      t.boolean :is_new
      t.integer :seconds_online
      t.integer :num_users
      t.integer :num_followers
      t.string :location
      t.string :username
      t.string :room_subject
    end
  end
end
