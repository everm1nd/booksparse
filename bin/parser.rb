require_relative '../lib/parser.rb'

def filename
  ARGV[0]
end

def mode
  ARGV[1] || :lines
end

puts Parser::Base.new(filename).parse(mode)
