module Resque
  class Worker
    alias_method :initialize_original, :initialize
    
    def initialize(queues = [], options = {})
      # Force synchronous reporting
      ::Rollbar.configure do |config|
        config.use_async = false
      end
      
      initialize_original queues, options
    end
  end
end
