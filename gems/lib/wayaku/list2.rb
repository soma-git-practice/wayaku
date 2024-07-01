module Wayaku
  module List2
    protected
    def list
      group = nested_grouping(data)
      group.each do |item|
        indent = "\s\s" * item[:count]
        puts "\r\n" if item[:count] == 2
        puts indent + item[:key]
        puts indent + item[:value]
      end
      nil
    end

    private
    def translation
      I18n.config.backend.translations[:ja]
    end

    def nested_grouping(argumant, count = 1)
      values = []
      argumant.each do |key, value|
        options = { count: count, key: key }
        if value.is_a?(Array)
          values << { **options, value: value[0] }
          values = values + nested_grouping(value[1], count + 1)
        else
          values << { **options, value: value }
        end
      end
      values
    end

    def data
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
  end
end