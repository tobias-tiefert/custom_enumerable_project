module Enumerable
  # Your code goes here
  def my_select
    return to_enum(:my_select) unless block_given?
    output = []
    for item in self
      if yield(item)
        output << item
      end
    end
    output
  end

  def my_all?
    for item in self
      if yield(item) == false
        return false
      end
    end
    true
  end

  def my_any?
    for item in self
      if yield(item)
        return true
      end
    end
    false
  end

  def my_none?
    for item in self
      if yield(item)
        return false
      end
    end
    true
  end

  def my_count
    counter = 0
    for item in self
      if block_given?
        if yield(item)
          counter += 1
        end
      else
        counter += 1
      end
    end
    counter
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    feedback = []
    for item in self
      feedback << yield(item)
    end
    feedback
  end

  def my_inject(accumulator = 0)
    return to_enum(:my_inject) unless block_given?
    for item in self
      accumulator = yield(accumulator, item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    for item in self
      yield(item)
    end
  end
end
