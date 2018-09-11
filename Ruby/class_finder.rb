# You have to implement a program that can be executed from the command line:

# ./class-finder <filename> '<pattern>'

# Where filename refers to the file containing class names separated by line
# breaks, e.g.:
# a.b.FooBarBaz
# c.d.FooBar

# Search pattern <pattern> must include class name camelCase UpperCase letters
# in the right order and it may contain lower case letters
# to narrow down the search results
# for example, 'FB', 'FoBa' and 'FBar' searches must all match a.b.FooBarBaz and
# c.d.FooBar classes.

# Upper Case letters written in the wrong order will not find any results, for
# example 'BF' will not find c.d.FooBar
# If the search pattern consists of only lower case characters then the search
# becomes case insensitive ('fbb' finds FooBarBaz but 'fBb' will not).

# If the search pattern ends with a space ' ' then the last word in the pattern
# must also be the last word of the found class name ('Fbar ' finds FooBar but
# not FooBarBaz).

# The search pattern may include wildcard characters '*' which match missing
# letters ('B*rBaz' finds FooBarBaz but BrBaz does not).

# The found class names must be sorted in alphabetical order ignoring package
# names (package names must still be included in the output).

# Solution limitations:
#  -> Regexp must not be used.
#  -> Use of other libraries (other than the language itself) is prohibited.

# Helper string methods
class String
  def camel_case?
    start_with?(self[0].downcase) && chars.any? { |c| c == c.upcase }
  end

  def lower_case?
    chars.all? { |c| c == c.downcase }
  end

  def upper_case?
    chars.all? { |c| c == c.upcase }
  end

  def split_capital_words
    out = []
    buf = ''
    chars.each do |c|
      if c.upper_case? && !start_with?(c)
        out << buf
        buf = ''
      end
      buf += c
    end
    out << buf
    out
  end

  def fuzzy_search(query)

  end
end

# The main class
class ClassFinder
  @sample = "a.b.FooBarBaz\nc.d.FooBar\nSomeRandomStuff"
  def query(str)
    if str.lower_case?

  end
end
