class SessionsController < ApplicationController

  def destroy
    log_out
    redirect_to root_url
  end
end