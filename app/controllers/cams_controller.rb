class CamsController < ApplicationController

  def index
    @model_list = []
    # https://chaturbate.com/affiliates/api/onlinerooms/?format=json&wm=9RAIT
    response = ExternalApiRequest.new(base_uri: 'https://chaturbate.com/affiliates/api/onlinerooms/?format=json&wm=9RAIT', http_method: 'get')

    c_response = response.response_body
    if response.response_code.to_s == "200"
      c_response_list = JSON.parse(c_response)
      c_response_list[0..59].each do |x|
        cam_model = CamModel.new
        cam_model.age = x["age"]
        cam_model.chat_room_url_revshare = x["chat_room_url_revshare"]
        cam_model.chat_room_url = x["chat_room_url"]
        cam_model.current_show = x["current_show"]
        cam_model.image_url = x["image_url"]
        cam_model.is_hd = x["is_hd"]
        cam_model.num_followers = x["num_followers"]
        cam_model.num_users = x["num_users"]
        cam_model.room_subject = x["room_subject"]
        cam_model.username = x["username"]
        @model_list << cam_model
      end
    end
    @model_list
  end

end
