require "bundler/setup"
Bundler.require

# I18n.config.backend.translations[:ja]

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