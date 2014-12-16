require 'active_job' unless Object.const_defined?(:ActiveJob)

module Devise
  module Async
    module Backend
      class ActiveJob < Base

        def self.enqueue(*args)
          # avoid symbols in params...
          escaped_args = args.map { |x| x.kind_of?(Symbol) ? x.to_s : x }

          if Runner.respond_to?(:perform_later)
            Runner.perform_later(*escaped_args)
          else
            Runner.enqueue(*escaped_args)
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
