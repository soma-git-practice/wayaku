module Wayaku
  extend_object ActiveRecord::Base
  autoload :Search, 'wayaku/search'
  autoload :List,   'wayaku/list'

  def wayaku(value = nil)
    extend value.present? ? Search : List
    puts run(value)
  end
end