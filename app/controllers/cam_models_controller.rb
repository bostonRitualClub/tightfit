class CamModelsController < ApplicationController

  def index
    cam_model_list = CamModel.where(active: true)
    params.permit(:age, :chat_room_url_revshare, :image_url, :is_hd, :num_followers, :num_users, :room_subject, :username, :chat_room_url, :current_show, :gender, :iframe_embed_revshare, :iframe_embed, :is_new, :location, :seconds_online, :active)

    if params["gender"]
      included_genders = params["gender"].values
      cam_model_list = cam_model_list.where(gender: included_genders)
    else
      cam_model_list = cam_model_list.where("gender = ?", "f")
    end

    params.keys.each do |param|
      cam_model_list = cam_model_list.where("username LIKE ? OR room_subject LIKE ?", "%#{params["search"]}%", "%#{params["search"]}%") unless params['search'].blank?
      cam_model_list = cam_model_list.where("age >= ?", params["age_start"]) unless params['age_start'].blank?
      cam_model_list = cam_model_list.where("age <= ?", params["age_end"]) unless params['age_end'].blank?
      cam_model_list = cam_model_list.where("num_users >= ?", params["view_start"]) unless params['view_start'].blank?
      cam_model_list = cam_model_list.where("num_users <= ?", params["view_end"]) unless params['view_end'].blank?
      cam_model_list = cam_model_list.where("is_hd = ?", params["is_hd"]) unless params['is_hd'].blank?
    end

    @cam_models = cam_model_list.paginate(page: params[:page], per_page: 100)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @cam_model = CamModel.find(params[:id])
    @cam_models = CamModel.where(gender: 'f', active: true).sample(20)
  end

  private

  def cam_model_refresh
    get_cam_models
    redirect_to action: "index"
  end

  def get_cam_models
    unless CamModel.maximum(:id).nil?
      if CamModel.maximum(:id) > 1000000
        purge_that_shit
      end
    end

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

  def purge_that_shit
    CamModel.destroy_all
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE cam_models_id_seq RESTART WITH 1")
  end
end
