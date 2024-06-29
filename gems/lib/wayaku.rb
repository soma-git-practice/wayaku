module Wayaku
  extend_object ActiveRecord::Base
  autoload :Search, 'wayaku/search'
  autoload :List,   'wayaku/list'

  include Search
  include List

  def wayaku(value = nil)
    puts value.present? ? search(value) : list
  end
end