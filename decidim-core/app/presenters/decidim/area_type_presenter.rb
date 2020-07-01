# frozen_string_literal: true

module Decidim
  #
  # Decorator for area types
  #
  class AreaTypePresenter < SimpleDelegator
    include Decidim::TranslationsHelper

    def translated_name
      @translated_name ||= translated(self, :name)
    end
  end
end
