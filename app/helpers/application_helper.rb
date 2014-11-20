module ApplicationHelper

  def map_marker(port)
    content_for :post_map_js do
      raw("addPortMarker(#{port.to_json});\n")
    end
  end

end
