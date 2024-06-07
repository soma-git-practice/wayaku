# i18n和訳一覧
def wayaku(model)
  klass = model.to_s.classify.constantize

  # モデル名
  text_value = klass.model_name.human + "\n"
  text_value += model.to_s + "\n\n"

  # Enumerizeが関わる属性を取得
  enumerize_group = Hash.new { |hash, key| hash[key] = [] }
  if klass.singleton_class.included_modules.include?(Enumerize)
    klass.enumerized_attributes.attributes.each do |key, val|
      enumerize_group[key] = val.values
    end
  end

  klass.column_names.each do |attr|
    # 属性名
    text_value += "\s\s#{I18n.t("activerecord.attributes.#{klass.table_name.singularize}.#{attr}")}\n"
    text_value += "\s\s#{attr}\n"

    # enumerize名
    if enumerize_group.include? attr
      enumerize_group[attr].each do |item|
        text_value += "\s\s\s\s#{item.text}\n"
        text_value += "\s\s\s\s#{item}\n"
      end
    end
    text_value += "\n"
  end

  puts text_value
end