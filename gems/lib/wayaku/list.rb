module Wayaku
  module List
    protected
      def list
        text = "\r\n"
        text += model_name.human + "\r\n"
        text += model_name.to_s + "\r\n\r\n"
        column_names.each do |attr|
          text += "\s\s" + human_attribute_name(attr) + "\r\n"
          text += "\s\s" + attr + "\r\n"
          if respond_to?(:enumerize) && enumerized_attributes[attr].present?
            enumerized_attributes[attr].each_value do |value|
              text += "\s\s\s\s" + value.text + "\r\n"
              text += "\s\s\s\s" + value + "\r\n"
            end
          end
          text += "\r\n"
        end
        text
      end
  end
end