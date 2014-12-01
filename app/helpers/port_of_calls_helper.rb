module PortOfCallsHelper

  def port_of_calls_path(url_options = {})
    ship_port_of_calls_path(url_options)
  end

  def port_of_call_path(poc, url_options = {})
    ship_port_of_call_path(poc.ship.friendly_id, poc, url_options)
  end

  def edit_port_of_call_path(poc, url_options = {})
    edit_ship_port_of_call_path(poc.ship.friendly_id, poc, url_options)
  end

  def new_port_of_call_path
    new_ship_port_of_call_path(params[:ship_id])
  end

  def port_of_calls_url(url_options = {})
    ship_port_of_calls_url(url_options)
  end

  def port_of_call_url(poc, url_options = {})
    ship_port_of_call_url(poc.ship.friendly_id, poc, url_options)
  end


  def add_segments_to_map(pocs)
    pocs.each_cons(2) do |from,to|
      content_for(:post_map_js) do
        raw("addCruiseSegment(#{from.port_id},#{to.port_id});")
      end
    end
  end

end
