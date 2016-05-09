require 'parser'

RSpec.describe Parser::Base do
  describe '#parse' do
    it 'returns a content of file' do
      expect(Parser::Base.new('fixtures/data/oneliner.txt').paragraphs).to eq("I am oneliner\n")
    end
  end
end
