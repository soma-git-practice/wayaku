module Wayaku
  module List2
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
      I18n.config.backend.translations[:ja]
    end

    def nested_locale_data
      {
        'user' => [
          'ユーザー',
          {
            'id' => 'ID',
            'name' => '名前',
            'gender' => [
              '性別',
              {
                'man' => '男性',
                'woman' => '女性'
              }
            ],
            'status' => [
              'ステータス',
              {
                'sleeping' => '寝ている',
                'working' => '働いている',
                'mystery' => '謎に包まれている'
              }
            ],
          }
        ]
      }
    end

    def transform(argumant, count = 1)
      values = []
      argumant.each do |key, value|
        options = { count: count, key: key }
        if value.is_a?(Array)
          values << { **options, value: value[0] }
          values = values + create_data(value[1], count + 1)
        else
          values << { **options, value: value }
        end
      end
      values
    end
  end
end