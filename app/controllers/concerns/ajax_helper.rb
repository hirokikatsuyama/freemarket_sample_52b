module AjaxHelper
  def ajax_redirect_to(redirect_url)
    { js: "window.location.replace('#{redirect_url}');" }
  end
end