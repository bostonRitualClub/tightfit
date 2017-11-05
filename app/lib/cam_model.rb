class CamModel
  # include ActiveModel::Model

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
                :seconds_online

  def initialize
    # id = generate_id
  end

  # def generate_id
  #   Random.rand.to_s[2..14]
  # end

  # def persisted?
  #   self.id == generate_id
  # end
end
