# frozen_string_literal: true

stocks = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def bubble(nums)
  sorted = false
  until sorted
    sorted = true 
    i = 0
    while i < nums.length - 1
      if nums[i] > nums[i + 1]
        aux = nums[i]
        nums[i] = nums[i + 1]
        nums[i + 1] = aux
        sorted = false # A swap occurred, so the array is not yet sorted
      end
      i += 1
    end
  end
  puts nums
end

bubble(stocks)
