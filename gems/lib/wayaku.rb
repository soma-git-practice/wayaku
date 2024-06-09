module Wayaku
  def wayaku
    puts model_name.human
    puts model_name
    column_names.each do |attr|
      puts "\s\s" + human_attribute_name(attr)
      puts "\s\s" + attr
      if respond_to?(:enumerize) && enumerized_attributes[attr].present?
        enumerized_attributes[attr].each_value do |value|
          puts "\s\s\s\s" + value.text
          puts "\s\s\s\s" + value
        end
      end
      puts "\r\n"
    end
  end
end

ActiveRecord::Base.extend Wayaku