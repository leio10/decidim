# frozen_string_literal: true

module Decidim
  module Meetings
    module AdminLog
      module ValueTypes
        # This class presents the given value as a Decidim::Meetings::MeetingTitleBody. Check
        # the `DefaultPresenter` for more info on how value presenters work.
        class MeetingTitleDescriptionPresenter < Decidim::Log::ValueTypes::DefaultPresenter
          def present
            return unless value

            renderer = Decidim::ContentRenderers::HashtagRenderer.new(h.translated(self, :value))
            renderer.render(links: false).html_safe
          end
        end
      end
    end
  end
end
