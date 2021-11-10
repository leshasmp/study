module Exercise
  module Arrays
    class << self
      def replace(array)
        result = []
        array.each do |el_source|
          array.each do |el|
            if el_source < el \
              && el_source.positive?
              el_source = el
            end
          end
          result << el_source
        end
        result
      end

      def search(_array, _query)
        if has_element(_array, _query)
          _array.find_index(_query)
        else
          -1
        end
      end
      
      def has_element(_array, _query)
        if _array.empty?
          return false
        end
        low = 0
        high = _array.length
        mid = low + ((high - low) / 2)
        quess = _array[mid]
        if quess == _query
          return true
        end
        if quess > _query
          high = mid
        else
          low = mid + 1
        end
        has_element(_array[low, high], _query)
      end
      
    end
  end
end
