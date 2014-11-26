module ApplicationHelper

  def sign_up_path(url_options = {})
    new_passenger_path(url_options)
  end

  def map_marker(port)
    content_for :post_map_js do
      raw("addPortMarker(#{port.to_json});\n")
    end
  end

end
