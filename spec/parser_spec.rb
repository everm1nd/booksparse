require 'parser'

RSpec.describe Parser::Base do
  describe '#parse' do
    it 'choose a strategy by :mode parameter' do
      expect(Parser::Strategies::Lines).to receive(:parse)
      Parser::Base.new('fixtures/data/1.txt').parse(:lines)
    end

    it 'returns exception if there is no such strategy' do
      expect { Parser::Base.new('fixtures/data/1.txt').parse(:wrong_strategy_name) }.to raise_error(Parser::Exceptions::WrongStrategy)
    end
  end
end
