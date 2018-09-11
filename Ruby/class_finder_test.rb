# class_finder.rb
require 'minitest/autorun'
require_relative 'class_finder'

# Main test class
class ClassFinderTest < Minitest::Test
  def setup
    @c = ClassFinder.new
  end

  def test_search_returns_class_names
    assert @c.query('FB') == %w[a.b.FooBarBaz c.d.FooBar]
    assert @c.query('FoBa') == %w[a.b.FooBarBaz c.d.FooBar]
    assert @c.query('FBar') == %w[a.b.FooBarBaz c.d.FooBar]
  end

  def test_search_returns_results_if_letters_are_in_order
    assert @c.query('BF') == %w[a.b.FooBarBaz]
  end

  def test_search_with_lowercase_arg_becomes_case_insensitive
    assert @c.query('fbb') == %w[a.b.FooBarBaz]
    assert @c.query('fBb').nil?
  end

  def test_if_arg_has_space_last_word_must_be_in_the_end
    assert @c.query('Fbar ') == %w[c.d.FooBar]
  end

  def test_search_understands_wildcard_characters
    assert @c.query('B*rBaz') == %w[a.b.FooBarBaz]
    assert @c.query('BrBaz').nil?
  end

  def test_search_results_should_be_sorted_alphabetically_in_class_name
    assert @c.query('FBar') == %w[c.d.FooBar a.b.FooBarBaz]
  end
end

# Testing the custom string methods.
class StringCustomMethodsTest < Minitest::Test
  def test_str_camelcase_works
    assert 'camelCase'.camel_case? == true
    assert 'NotCamelCase'.camel_case? == false
  end

  def test_split_capital_words_should_work
    assert 'FooBar'.split_capital_words == %w[Foo Bar]
  end
end
