module Wayaku
  autoload :Base, 'wayaku/base'

  def self.extended(base)
    base.include Wayaku::Base
  end
end
