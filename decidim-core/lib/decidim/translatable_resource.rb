# frozen_string_literal: true

require "active_support/concern"

module Decidim
  module TranslatableResource
    extend ActiveSupport::Concern

    included do
      after_create :machine_translation
      after_update :machine_translation
      def self.translatable_fields(*list)
        @translatable_fields = list
      end

      def self.translatable_fields_list
        @translatable_fields
      end
    end

    def machine_translation
      Decidim::MachineTranslationResourceJob.perform_later(self)
    end
  end
end
