require 'runify'
require 'racc'
require 'stringio'

module Io
	def self.load_io(input)
		tok     = RUNIFY::Tokenizer.new input
		parser  = RUNIFY::Parser.new tok
		parser.parse!
	end

	def self.load(str)
		load_io StringIO.new str
	end
end

module TestIo
	def self.ast str = 'x=y'
	Io.load str
	end

	def self.unif prob
		unif = RUNIFY::Unification.new
		unif.unify_system! prob
	end

	def self.test2
		unif ast
	end

	def self.map_to_str m
		s = ""
		m.each do |k, v|
			s += k.to_str + " => " + v.to_str + "\n"
		end
		return s
	end


	def self.test data = 'x = f(y,z)'
		unifier = RUNIFY::UnificationHandler.new
		unifier.load!(data)
		res = unifier.interpret!
		if res
			return map_to_str unifier.results
		else
			return unifier.error_log
		end
			
	end

	public :test

end
