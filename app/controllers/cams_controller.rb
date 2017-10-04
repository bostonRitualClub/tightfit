class CamsController < ApplicationController

  def index
    @model_list = []
    c_response = ExternalApiRequest.new(base_uri: 'https://chaturbate.com/affiliates/api/onlinerooms/?format=json&wm=9RAIT', http_method: 'get').response_body
    c_response_list = JSON.parse(c_response)
    c_response_list[0..10].each do |x|
      cam_model = CamModel.new
      cam_model.image_url = x["image_url"]
      cam_model.age = x["age"]
      cam_model.username = x["username"]
      cam_model.is_hd = x["is_hd"]
      @model_list << cam_model
    end
    @model_list
  end
end
