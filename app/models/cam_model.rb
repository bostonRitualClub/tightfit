class CamModel < ActiveRecord::Base
  attr_accessor :age,
                 :chat_room_url_revshare,
                 :image_url,
                 :is_hd,
                 :num_followers,
                 :num_users,
                 :room_subject,
                 :username,
                 :chat_room_url,
                 :current_show,
                 :gender,
                 :iframe_embed_revshare,
                 :iframe_embed,
                 :is_new,
                 :location,
                 :seconds_online,
                 :active
end
