module Devise
  module Async
    module Backend
      class ActiveJob < Base

        def self.enqueue(*args)
          if Runner.respond_to?(:perform_later)
            Runner.perform_later(*args)
          else
            Runner.enqueue(*args)
          end
        end

        class Runner < ::ActiveJob::Base
          queue_as Devise::Async.queue

          def perform(*args)
            ::Devise::Async::Backend::ActiveJob.new.perform(*args)
          end
        end

      end
    end
  end
end
