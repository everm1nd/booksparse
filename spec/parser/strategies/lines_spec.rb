require 'parser'
require 'parser/strategies/lines'

RSpec.describe Parser::Strategies::Lines do
  describe '#parse' do
    let(:data) { File.new('fixtures/data/3lines.txt').read }

    it 'returns an array of lines ignoring emptylines' do
      expect(Parser::Strategies::Lines.parse(data).count).to eq 3
    end
  end
end
