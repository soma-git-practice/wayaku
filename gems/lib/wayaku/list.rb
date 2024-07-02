module Wayaku
  module List
    include Base

    protected
      def list
        group = transform(nested_locale_data)
        group.each do |item|
          indent = "\s\s" * item[:count]
          puts "\r\n" if item[:count] == 2
          puts indent + item[:key]
          puts indent + item[:value]
        end
        nil
      end

    private
      def nested_locale_data
        hash = wayaku_attributes.each_with_object({}) do |array, obj|
          key, value = array
          obj[key] = wayaku_enumerize.has_key?(key) ? [value, wayaku_enumerize[key]] : value
        end
        { model_symbol => [ wayaku_name, hash ] }
      end

      def transform(arg_hash, count = 1)
        values = []
        arg_hash.each do |key, value|
          options = { count: count, key: key.to_s }
          if value.is_a?(Array)
            values << { **options, value: value[0] }
            values = values + transform(value[1], count + 1)
          else
            values << { **options, value: value }
          end
        end
        values
      end
  end
end
