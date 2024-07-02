module Wayaku
  module Search
    include Base

    protected
      def search(value)
        return "\r\n警告\：引数は文字列\r\n\r\n" unless (value).is_a? String
        mix = wayaku_attributes.merge(wayaku_flatten_enumerize)
        mix = mix.invert unless value.match?(/^[a-z]+$/)
        mix = mix.transform_keys(&:to_s)
        "\r\n#{ mix[value] || '警告：何も見つかりませんでした' }\r\n\r\n"
      end

    private
      def wayaku_flatten_enumerize
        enumerized = wayaku_enumerize.values
        enumerized.inject { |result, item| result.merge(item) }
      end
  end
end
