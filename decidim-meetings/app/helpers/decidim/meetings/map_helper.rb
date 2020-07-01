# frozen_string_literal: true

module Decidim
  module Meetings
    # This helper include some methods for rendering meetings dynamic maps.
    module MapHelper
      include Decidim::SanitizeHelper
      # Serialize a collection of geocoded meetings to be used by the dynamic map component
      #
      # meetings - A collection of meetings
      def meetings_data_for_map(meetings)
        geocoded_meetings = meetings.select(&:geocoded?)
        geocoded_meetings.map do |meeting|
          meeting.slice(:latitude, :longitude, :address).merge(title: translated(meeting, :title),
                                                               description: translated(meeting, :description),
                                                               startTimeDay: l(meeting.start_time, format: "%d"),
                                                               startTimeMonth: l(meeting.start_time, format: "%B"),
                                                               startTimeYear: l(meeting.start_time, format: "%Y"),
                                                               startTime: "#{meeting.start_time.strftime("%H:%M")} - #{meeting.end_time.strftime("%H:%M")}",
                                                               icon: icon("meetings", width: 40, height: 70, remove_icon_class: true),
                                                               location: translated(meeting, :location),
                                                               locationHints: decidim_html_escape(translated(meeting, :location_hints)),
                                                               link: resource_locator(meeting).path)
        end
      end
    end
  end
end
