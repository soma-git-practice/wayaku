module Wayaku
  extend_object ActiveRecord::Base
  autoload :Search, 'wayaku/search'
  # autoload :List,   'wayaku/list'
  autoload :List2,   'wayaku/list2'

  include Search
  # include List
  include List2

  def wayaku(value = nil)
    puts value.present? ? search(value) : list
  end
end