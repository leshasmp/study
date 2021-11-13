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
          num.positive? ? num = max_number : num
        end
      end

      def search(array, query)
        low = 0
        high = array.length
        while low <= high
          mid = (low + high) / 2
          quess = array[mid]
          if quess.nil?
            return -1
          end
          if quess == query
            return mid
          end
          if quess > query
            high = mid - 1;
          else
            low = mid + 1
          end
        end
        -1
      end
      
    end
  end
end
