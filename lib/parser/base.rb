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

    def parse(mode = :lines)
      strategy(mode).parse(self.content)
    end

    private
    def strategy(mode)
      strategy_name = mode.to_s.capitalize
      raise Parser::Exceptions::WrongStrategy unless File.exists?("./lib/parser/strategies/#{strategy_name}.rb")
      Kernel.const_get('Parser::Strategies::' + strategy_name)
    end
  end
end
