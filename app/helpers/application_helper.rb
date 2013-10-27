module ApplicationHelper
  def is_mobile_request?
    user_agent = request.env["HTTP_USER_AGENT"]
    user_agent.include?('Mobile') || user_agent.include?('Android')
  end
end
