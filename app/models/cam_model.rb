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


  validates  :age, presence: true
  validates  :chat_room_url_revshare, presence: true
  validates  :image_url, presence: true
  validates  :is_hd, presence: true
  validates  :num_followers, presence: true
  validates  :num_users, presence: true
  validates  :room_subject, presence: true
  validates  :username, presence: true
  validates  :chat_room_url, presence: true
  validates  :current_show, presence: true
  validates  :gender, presence: true
  validates  :iframe_embed_revshare, presence: true
  validates  :iframe_embed, presence: true
  validates  :is_new, presence: true
  validates  :location, presence: true
  validates  :seconds_online, presence: true
  validates  :active, presence: true

end
