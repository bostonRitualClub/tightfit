class CamModelsController < ApplicationController

  def index
    @cam_model_list = CamModel.all
    params.permit(:age, :chat_room_url_revshare, :image_url, :is_hd, :num_followers, :num_users, :room_subject, :username, :chat_room_url, :current_show, :gender, :iframe_embed_revshare, :iframe_embed, :is_new, :location, :seconds_online, :active)

    if params["gender"]
      included_genders = params["gender"].values
      @cam_model_list = @cam_model_list.where(gender: included_genders)
    else
      @cam_model_list = @cam_model_list.where("gender = ?", "f")
    end

    params.keys.each do |param|
      @cam_model_list = @cam_model_list.where("username LIKE ?", "%#{params["search"]}%") if param == "search"
      @cam_model_list = @cam_model_list.where("age >= ?", params["age_start"]) if param == "age_start"
      @cam_model_list = @cam_model_list.where("age <= ?", params["age_end"]) if param == "age_end"
      @cam_model_list = @cam_model_list.where("num_users >= ?", params["view_start"]) if param == "view_start"
      @cam_model_list = @cam_model_list.where("num_users <= ?", params["view_end"]) if param == "view_end"
      @cam_model_list = @cam_model_list.where("is_hd = ?", params["is_hd"]) if param == "is_hd"
    end

    @cam_model_list
  end

  def cam_model
    render "show"
  end

  def cam_model_refresh
    redirect_to action: 'index'
    get_cam_models

  end

  private

  def get_cam_models
    # TODO: allow get_cam_models to take in a page parameter for infinite scroll
    response = ExternalApiRequest.new(base_uri: 'https://chaturbate.com/affiliates/api/onlinerooms/?format=json&wm=9RAIT', http_method: 'get')

    CamModel.update_all(active: false)

    c_response = response.response_body
    if response.response_code.to_s == "200"
      c_response_list = JSON.parse(c_response)

      c_response_list.each do |raw_model|
        if CamModel.find_by(username: raw_model['username'])
          cam_model = CamModel.find_by(username: raw_model['username'])
          cam_model.update(
            age:  raw_model["age"],
            chat_room_url_revshare:  raw_model["chat_room_url_revshare"],
            chat_room_url:  raw_model["chat_room_url"],
            current_show:  raw_model["current_show"],
            gender:  raw_model["gender"],
            image_url:  raw_model["image_url"],
            iframe_embed_revshare:  raw_model["iframe_embed_revshare"],
            iframe_embed:  raw_model["iframe_embed"],
            is_hd:  raw_model["is_hd"],
            is_new:  raw_model["is_new"],
            location:  raw_model["location"],
            seconds_online:  raw_model["seconds_online"],
            num_followers:  raw_model["num_followers"],
            num_users:  raw_model["num_users"],
            username:  raw_model["username"],
            room_subject:  raw_model["room_subject"],
            active:  true
          )
        else
          CamModel.new.tap do |model|
            model["age"] = raw_model["age"]
            model["chat_room_url_revshare"] = raw_model["chat_room_url_revshare"]
            model["chat_room_url"] = raw_model["chat_room_url"]
            model["current_show"] = raw_model["current_show"]
            model["gender"] = raw_model["gender"]
            model["image_url"] = raw_model["image_url"]
            model["iframe_embed_revshare"] = raw_model["iframe_embed_revshare"]
            model["iframe_embed"] = raw_model["iframe_embed"]
            model["is_hd"] = raw_model["is_hd"]
            model["is_new"] = raw_model["is_new"]
            model["location"] = raw_model["location"]
            model["seconds_online"] = raw_model["seconds_online"]
            model["num_followers"] = raw_model["num_followers"]
            model["num_users"] = raw_model["num_users"]
            model["username"] = raw_model["username"]
            model["room_subject"] = raw_model["room_subject"]
            model["active"] = true
            model.save!
          end
        end
      end
    end

    delete_inactive_cam_models

    CamModel.all
  end

  def delete_inactive_cam_models
    CamModel.where(active: false).destroy_all
  end
end
