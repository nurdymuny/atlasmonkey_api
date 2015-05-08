class Api::V1::ApiBaseController < ApplicationController
  skip_before_filter :verify_authenticity_token
end
