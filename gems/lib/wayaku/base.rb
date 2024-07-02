module Wayaku
  module Base
    private
      def wayaku_hash
        I18n.config.backend.translations[:ja]
      end

      def model_symbol
        name.downcase.to_sym
      end

      def wayaku_name
        wayaku_hash[:activerecord][:models][model_symbol]
      end

      def wayaku_attributes
        wayaku_hash[:activerecord][:attributes][model_symbol]
      end

      def wayaku_enumerize
        wayaku_hash[:enumerize][model_symbol]
      end
  end
end
