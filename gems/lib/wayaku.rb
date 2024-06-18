module Wayaku
  def wayaku(arg = nil)
    case arg.class.name
    when 'NilClass'
      wayaku_list
    when 'String'
      wayaku_serch(arg)
    else
      puts '引数は文字列型または、nil'
    end
  end

  # 全属性の和訳
  def wayaku_list
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

  def wayaku_serch(arg)
    begin
      puts "\n"
      if arg.first.bytesize == 1 # 引数はアルファベット
        # モデルクラス名の英名と等しい場合
        if arg === model_name.singular
          puts model_name.human
          return
        end

        column_names.each do |attr|
          # 属性の英名と等しい場合
          if arg == attr
            puts human_attribute_name(arg)
            return
          end

          # Enumerizeのinオプションの値の英名と等しい場合
          if respond_to?(:enumerize) && enumerized_attributes[attr].present? and enumerized_attributes[attr].values.include?(arg)
            value = enumerized_attributes[attr].find_value(arg)
            puts value.text
            return
          end
        end

      else # 引数は日本語
        # モデルクラスの和名と等しい場合
        if arg == model_name.human
          puts model_name
        end

        column_names.each do |attr|
          # 属性の和名と等しい場合
          if arg == human_attribute_name(attr)
            puts attr
            return
          end

          # Enumerizeのinオプションの値の和名と等しい場合
          if respond_to?(:enumerize) && enumerized_attributes[attr].present?
            target = nil
            enumerized_attributes[attr].each_value do |value|
              target = value if arg == value.text
            end
            if target != nil
              puts target
              return
            end
          end
        end
      end

      # 何も等しくない場合
      puts arg + 'での検索では、何も見つかませんでした'
    ensure
      puts "\n"
    end
  end
end

ActiveRecord::Base.extend Wayaku