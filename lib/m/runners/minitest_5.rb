module M
  module Runners
    class Minitest5 < Base
      def suites
        Minitest::Runnable.runnables
      end

      def run(test_arguments)
        output = Minitest.run test_arguments
        ::Minitest.class_variable_get(:@@after_run).reverse_each(&:call)
        output
      end

      def test_methods(suite_class)
        suite_class.runnable_methods
      end
    end
  end
end
