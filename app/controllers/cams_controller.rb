class CamsController < ApplicationController

  def index
    @cam_model_list = get_cam_models
    update_cam_models(@cam_model_list)

    if params["gender"]
      included_genders = params["gender"].values
      @cam_model_list.select! { |x| included_genders.include?(x.gender) }
    else
      # We want to filter by females by default
      params["gender"] = Hash.new()
      params["gender"]["female"] = 'f'
      @cam_model_list.select! { |x| x.gender == "f" }
    end

    params.keys.each do |param|
      @cam_model_list.select! { |x| x.username.include? params["search"] } if param == "search"
      @cam_model_list.select! { |x| x.age >= params["age_start"].to_i } if param == "age_start"
      @cam_model_list.select! { |x| x.age <= params["age_end"].to_i } if param == "age_end"
      @cam_model_list.select! { |x| x.num_users >= params["view_start"].to_i } if param == "view_start"
      @cam_model_list.select! { |x| x.num_users <= params["view_end"].to_i } if param == "view_end"
      @cam_model_list.select! { |x| x.is_hd == true } if param == "is_hd"
    end

    @cam_model_list
  end

  def update_cam_models(cam_model_list)
    cam_model_list.each do |cam_model|
      cam_model_params = #some logic here to turn cam_model into a params list

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
      cam_model.seconds_online = x["seconds_online"]
      cam_model.num_followers = x["num_followers"]
      cam_model.num_users = x["num_users"]
      cam_model.username = x["username"]
      cam_model.room_subject = x["room_subject"]

      @cam_model = CamModel.new(cam_model_params)
      @cam_model.save
    end
  end

  def cam_model
    render "show"
  end

  private

  def get_cam_models
    # TODO: allow get_cam_models to take in a page parameter for infinite scroll
    cam_model_list = Array.new()
    response = ExternalApiRequest.new(base_uri: 'https://chaturbate.com/affiliates/api/onlinerooms/?format=json&wm=9RAIT', http_method: 'get')
    # response = ExternalApiRequest.new(base_uri: 'https://pto.awecr.com/xml/feed/index.php?siteId=jasmin&psId=tightfitcams&psTool=213_1&psProgram=pps&campaignId=&category=girl&limit=10&imageSizes=320x240&imageType=erotic&showOffline=0&extendedDetails=1&responseFormat=json&performerId=&subAffId={SUBAFFID}', http_method: 'get')

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
        cam_model.seconds_online = x["seconds_online"]
        cam_model.num_followers = x["num_followers"]
        cam_model.num_users = x["num_users"]
        cam_model.username = x["username"]
        cam_model.room_subject = x["room_subject"]
        cam_model_list << cam_model
      end
    end

    cam_model_list
  end
end
