module ApplicationHelper
  include Pagy::Frontend

  def hide_sidebar?
    (controller_name == 'devise') && action_name == 'new'
  end
end
