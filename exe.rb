require "bundler/setup"
Bundler.require

I18n.load_path = ['translation.yml']
I18n.locale = :ja

class User < ActiveRecord::Base
  establish_connection adapter: "sqlite3", database: "sqlite.db"
  self.logger = ::Logger.new(STDOUT, level: Logger::DEBUG)

  connection.create_table table_name do |t|
    t.string :name
    t.string :gender
    t.string :status
    t.string :email
  end unless table_exists?

  extend Enumerize
  enumerize :gender, in: [:man, :woman]
  enumerize :status, in: [:sleeping, :working, :mystery]
end

require_relative 'wayaku'

wayaku :user