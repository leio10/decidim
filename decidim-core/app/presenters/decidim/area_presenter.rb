# frozen_string_literal: true

module Decidim
  #
  # Decorator for areas
  #
  class AreaPresenter < SimpleDelegator
    include Decidim::TranslationsHelper

    def translated_name
      @translated_name ||= translated(self, :name)
    end
  end
end
