desc "Refresh Cam Models"
task refresh_cam_models: :environment do
  include Rails.application.routes.url_helpers
  app = ActionDispatch::Integration::Session.new(Rails.application)
  app.get "/cam_model/refresh"
  puts "Updating cams..."
end
