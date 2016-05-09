module Parser
  module Strategies
    class Lines
      def self.parse(data)
        data.split(/\n/).reject(&:empty?)
      end
    end
  end
end
