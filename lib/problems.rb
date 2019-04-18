# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
# def least_common_multiple(num_1, num_2)
#     num_1.lcm(num_2)
# end

def least_common_multiple(num_1, num_2)
    (1..num_1 * num_2).each do |el|
        return el if el % num_1 == 0 && el % num_2 == 0
    end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_hash = Hash.new(0)

    i = 0
    while i < str.length - 1
        bigram_hash[str[i..i+1]] += 1
        i += 1
    end

    bigram_hash.max_by {|k, v| v}[0]
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        output = {}
        self.each {|k,v| output[v] = k}
        output
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0

        i = 0
        while i < self.length - 1
            j = i + 1
            while j < self.length
                count += 1 if self[i] + self[j] == num
                j += 1
            end
            i += 1
        end
        count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}
        sorted = false

        until sorted
            sorted = true
            i = 0
            while i < self.length - 1
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
                i += 1
            end
        end
        self
    end
end
