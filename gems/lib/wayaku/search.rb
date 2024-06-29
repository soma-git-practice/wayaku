module Wayaku
  module Search
    protected
      def search(value)
        return "\r\n警告\：引数は文字列\r\n\r\n" unless (value).is_a? String
        mix = wayaku_attributes.merge(wayaku_enumerized)
        mix = mix.invert unless value.match?(/^[a-z]+$/)
        mix = mix.transform_keys(&:to_s)
        result = mix[value].to_s
        result = result.presence || '警告：何も見つかりませんでした'
        result = "\r\n" + result + "\r\n\r\n"
      end

    private
      def wayaku_hash
        I18n.config.backend.translations[:ja]
      end

      def model_symbol
        model_name.singular.to_sym
      end

      def wayaku_attributes
        wayaku_hash[:activerecord][:attributes][model_symbol]
      end

      def wayaku_enumerized
        enumerized = wayaku_hash[:enumerize][model_symbol].values
        enumerized = enumerized.inject { |result, item| result.merge(item) }
        enumerized
      end
  end
end