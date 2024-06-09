Gem::Specification.new do |s|
  s.author = ['soma'.freeze]
  s.files =  Dir['lib/**/*.rb'.freeze]
  s.name = 'wayaku'.freeze
  s.summary = 'モデルの属性を和訳する'.freeze
  s.version = '0.0.0'.freeze

  s.add_development_dependency 'sqlite3', '~> 1.7.3'
  s.add_development_dependency 'activerecord', '~> 7.1.3.2'
  s.add_development_dependency 'enumerize'
end