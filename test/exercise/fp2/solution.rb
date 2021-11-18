module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = self.my_reduce([]) do |acc, el|
          acc << yield(el)
        end
        self.class.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.my_reduce([]) do |acc, el|
          if !el.nil?
            acc << el
          end
          acc
        end
        self.class.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        self.my_each do |el|
          if acc.nil?
            acc = el
          else
            acc = yield acc, el
          end
        end
        acc
      end

    end
  end
end
