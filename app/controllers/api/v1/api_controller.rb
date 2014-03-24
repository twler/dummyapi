class Api::V1::ApiController < ApplicationController
  before_action :authenticate_api_key
  before_action :enforce_rate_limit
  respond_to :json
  
private

  def authenticate_api_key
    render json: { error: "Unauthorized" }, status: 401 and return unless params[:api_key] == "123456789"
  end
  
  def enforce_rate_limit
    rate_limit = 60 # per minute
    $recent_hits = $recent_hits.to_a << Time.now
    $recent_hits = $recent_hits.last(rate_limit)
    render json: { error: "Request limit exceeded" }, status: 429 and return if $recent_hits.count >= rate_limit && $recent_hits.map { |t| t > 1.minute.ago }.uniq == [true]
  end

end