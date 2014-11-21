module CruiseSegmentsHelper

  def cruise_segments_path
    cruise_cruise_segments_path
  end

  def cruise_segment_path(segment, url_options = {})
    cruise_cruise_segment_path(segment.cruise.friendly_id, segment, url_options)
  end

  def edit_cruise_segment_path(segment, url_options = {})
    edit_cruise_cruise_segment_path(segment.cruise.friendly_id, segment, url_options)
  end

  def new_cruise_segment_path
    new_cruise_cruise_segment_path(params[:cruise_id])
  end

end
