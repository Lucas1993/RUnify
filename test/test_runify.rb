require 'minitest/autorun'
require_relative './test_io.rb'

class RunifyTest < Minitest::Test
  def test_symbol_clash
	assert_equal "Unification failure",
	  TestIo.test("x=y")
  end

  def test_occurs 
	assert_equal "Unification failure",
	  TestIo.test("X=f(X)")
  end

  def test_ok1
	assert_equal "X => y\n",
	  TestIo.test("X=y")
  end

  def test_ok2
	assert_equal "X => f(y)\n",
	  TestIo.test("X=f(y)")
  end
end
