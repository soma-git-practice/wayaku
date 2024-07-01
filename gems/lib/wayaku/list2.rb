module Wayaku
  module List2
    protected
    def list
      puts "\r\n"
      group = nested_hash_group(create_data)
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

    def nested_hash_group(argumant, count = 1)
      values = []
      argumant.each do |key, value|
        key = key.to_s
        options = { count: count, key: key }
        if value.is_a?(Array)
          values << { **options, value: value[0].to_s }
          values = values + nested_hash_group(value[1], count + 1)
        else
          values << { **options, value: value.to_s }
        end
      end
      values
    end

    def create_data
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