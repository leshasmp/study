module Exercise
  module Arrays
    class << self
      def replace(array)
        positive_numbers = array.select { |num| num.positive? }
        max_number = array.first
        positive_numbers.each do |num|
          if max_number < num
            max_number = num
          end
        end
        array.map do |num|
          if num.positive?
            num = max_number
          else
            num
          end
        end
      end

      def search(array, query)
        if has_element(array, query)
          array.find_index(query)
        else
          -1
        end
      end
      
      def has_element(array, query)
        if array.empty?
          return false
        end
        low = 0
        high = array.length
        mid = low + ((high - low) / 2)
        quess = array[mid]
        if quess == query
          return true
        end
        if quess > query
          high = mid
        else
          low = mid + 1
        end
        has_element(array[low, high], query)
      end
      
    end
  end
end
