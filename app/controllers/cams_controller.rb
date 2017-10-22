class CamsController < ApplicationController

  def index
    raw_model_list = get_models
    @model_list = Array.new()

    if params["gender"]
      included_genders = params["gender"].values
      raw_model_list.select! { |x| included_genders.include?(x.gender) }
    else
      # We want to filter by females by default
      raw_model_list.select! { |x| x.gender == "f" }
    end
    
    params.keys.each do |param|
      raw_model_list.select! { |x| x.username.include? params["search"] } if param == "search"
      raw_model_list.select! { |x| x.age >= params["age_start"].to_i } if param == "age_start"
      raw_model_list.select! { |x| x.age <= params["age_end"].to_i } if param == "age_end"
      raw_model_list.select! { |x| x.num_users >= params["view_start"].to_i } if param == "view_start"
      raw_model_list.select! { |x| x.num_users <= params["view_end"].to_i } if param == "view_end"
      raw_model_list.select! { |x| x.is_hd == true } if param == "is_hd"
    end
    
    @model_list = raw_model_list
    @model_list
  end

  private

  def get_models
    # do this with infinite scroll
    model_list = Array.new()
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
        cam_model.gender = x["gender"]
        cam_model.image_url = x["image_url"]
        cam_model.iframe_embed_revshare = x["iframe_embed_revshare"]
        cam_model.iframe_embed = x["iframe_embed"]
        cam_model.is_hd = x["is_hd"]
        cam_model.is_new = x["is_new"]
        cam_model.location = x["location"]
        cam_model.num_followers = x["num_followers"]
        cam_model.num_users = x["num_users"]
        cam_model.room_subject = x["room_subject"]
        cam_model.username = x["username"]
        model_list << cam_model
      end
    end
    
    model_list
  end  
end
