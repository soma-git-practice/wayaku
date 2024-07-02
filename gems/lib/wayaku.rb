module Wayaku
  extend_object ActiveRecord::Base
  autoload :Base,   'wayaku/base'
  autoload :Search, 'wayaku/search'
  autoload :List,   'wayaku/list'

  include Base
  include Search
  include List

  def wayaku(value = nil)
    puts value.present? ? search(value) : list
  end
end