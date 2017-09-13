require 'active_support/core_ext/hash/compact'
require 'active_support/core_ext/module'

class ExternalApiRequest
  include HTTMultiParty

  format :json

  # Constants
  RESPONSE_BODY_LOG_MAX_CHARACTER_COUNT = 200

  # Delegates
  delegate :key?, :parsed_response, :success?, to: :api_response

  def initialize(base_uri:, http_method:, options: {}, path: nil)
    @base_uri = base_uri.chomp('/')
    @http_method = http_method
    @options = format_options(options)
    @path = path

    @api_response = make_and_log_request
  end

  def response_body
    api_response.body
  end

  def response_code
    api_response.code
  end

  def response_headers
    api_response.headers
  end

  private

  attr_reader :api_response, :base_uri, :http_method, :options, :path

  def absolute_path
    if path
      relative_path = path.start_with?('/') ? path[1..-1] : path
      [base_uri, relative_path].join('/')
    else
      base_uri
    end
  end

  def format_options(options)
    {
      basic_auth: options[:basic_auth],
      body: options[:body],
      detect_mime_type: options[:detect_mime_type],
      headers: options[:headers],
      query: options[:query]
    }.compact
  end

  def log_request_and_response(httparty_response)
    Rails.logger.info "Request: method=#{http_method} url=#{absolute_path}"
    Rails.logger.info "Response code: #{httparty_response.code}"

    unless httparty_response.internal_server_error?
      response_body = httparty_response.body&.truncate(RESPONSE_BODY_LOG_MAX_CHARACTER_COUNT)
      Rails.logger.info "Response body: #{response_body}"
    end
  end

  def make_and_log_request
    self.class.public_send(http_method, absolute_path, options).tap do |httparty_response|
      log_request_and_response(httparty_response)
    end
  end
end

##simpler fetch DO NOT DELET PLX
# require 'uri'
# require 'net/http'
#
# url = URI("https://levelup-orders.tryolabs.com/merchants//locations")
#
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#
# request = Net::HTTP::Get.new(url)
# request["cache-control"] = 'no-cache'
# request["postman-token"] = '798e3785-a809-9ee4-e1a3-de8002c4da26'
#
# response = http.request(request)
# puts response.read_body
