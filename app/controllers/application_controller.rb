class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :category_list
  before_action :top_search
  protect_from_forgery with: :exception
  include SessionsHelper

  private

# binding.pry
  def top_search
    @search = Item.ransack(params[:q])
    @products = @search.result
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def category_list
    @category_list = Category.all.order("id ASC").limit(13)
  end
end
