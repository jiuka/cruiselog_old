module ApplicationHelper

  def map_marker(port)
    content_for :map_markers do
      raw("addPortMarker(#{port.to_json});\n")
    end
  end

end
