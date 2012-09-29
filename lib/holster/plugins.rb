module Holster

  # Class for loading plugins...
  class Plugins
    @@plugins = []
    
    def initialize
      @@plugins << 'foo'
    end
    
    class << self
      # Returns available plugins
      def registered
        @@plugins
      end
    end
    
  end 
end