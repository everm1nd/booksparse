require_relative './strategies'

module Parser
  class Base
    attr_accessor :file

    def initialize(filename)
      @file = File.open(filename)
    end

    def content
      @content ||= @file.read
    end

    def paragraphs
      @paragraphs = parse(self.content)
    end

    private
    def parse(data, mode = :lines)
      strategy(mode).parse(data)
    end

    def strategy(mode)
      strategy_name = mode.to_s.capitalize
      Kernel.const_get('Parser::Strategies::' + strategy_name)
      # self.respond_to?(method_name) ? self.send(method_name, data) : raise("Unsupported parser method '#{method_name}'")
    end
  end
end
