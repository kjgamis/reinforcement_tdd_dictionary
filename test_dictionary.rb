require 'minitest/autorun'
require 'minitest/pride'
require './dictionary.rb'

class TestDictionary < MiniTest::Test
  def setup
    @d = Dictionary.new
  end

  def test_empty_on_creation
    # skip
    assert_empty @d.entries
  end

  def test_add_entry_with_keyword_and_definition
    # skip
    @d.add('fish' => 'aquatic animal')
    assert_equal({'fish' => 'aquatic animal'}, @d.entries)
    assert_equal ['fish'], @d.keywords
  end

  def test_add_keywords_without_definition
    # skip
    @d.add('fish')
    assert_equal({'fish' => nil}, @d.entries)
    assert_equal ['fish'], @d.keywords
  end

  def test_check_if_keyword_exists
    # skip
    # refute asserts falsy, !assert
    refute @d.include?('fish')
  end

  def test_check_if_keyword_exists_after_add
    # skip
    refute @d.include?('fish') # if the method is empty, this test passes
    @d.add('fish')
    assert @d.include?('fish') # confirms that it actually checks
    refute @d.include?('bird') # confirms not always returning true after add
  end

  def test_does_not_include_prefix
    # skip
    @d.add('fish')
    refute @d.include?('fi')
  end

  def test_does_not_find_word_in_empty_dictionary
    # skip
    assert_empty @d.find('fi')
  end

  def test_finds_nothing_if_prefix_matches_nothing
    # skip
    @d.add('fiend')
    @d.add('great')
    assert_empty @d.find('nothing')
  end

  def test_finds_entry
    # skip
    @d.add('fish' => 'aquatic animal')
    assert_equal({'fish' => 'aquatic animal'}, @d.find('fish'))
  end

  def test_finds_multiple_matches_from_prefix_and_returns_entire_entry
    # skip
    @d.add('fish' => 'aquatic animal')
    @d.add('fiend' => 'wicked person')
    @d.add('great' => 'remarkable')
    assert_equal({'fish' => 'aquatic animal', 'fiend' => 'wicked person'}, @d.find('fi'))
  end

  def test_lists_words_alphabetically
    # skip
    @d.add('zebra' => 'African land animal with stripes')
    @d.add('fish' => 'aquatic animal')
    @d.add('apple' => 'fruit')
    # Enter %w(apple fish zebra) in irb and see what happens
    assert_equal %w(apple fish zebra), @d.keywords
  end
end
