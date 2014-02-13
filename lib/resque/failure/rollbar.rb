module Resque
  module Failure
    class Rollbar < Base
      def save
        merge_notifier_params_if_passed!
        ::Rollbar.report_exception(exception, payload)
      end

      private

      def merge_notifier_params_if_passed!
        if exception.respond_to?(:notifier_params) && exception.notifier_params.is_a?(Hash)
          payload.merge!(exception.notifier_params)
        end
      end

    end
  end
end
