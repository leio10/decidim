# frozen_string_literal: true

module Decidim
  module Meetings
    class UpcomingMeetingEvent < Decidim::Events::SimpleEvent
      def resource_text
        translated(resource, :description)
      end
    end
  end
end
