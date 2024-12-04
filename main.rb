# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substring(words, dic)
  answer = {}

  words = words.split('')
  words = words.select do |element|
    element != '?' && element != "'" && element != '!' && element != ',' && element != 's'
  end
  words = words.join.split
  words.each do |str|
    dic.each do |d|
      if str.downcase[d]
        puts 'si'
        answer[d] ? answer[d] += 1 : answer[d] = 1
      else
        puts 'nope'
      end
    end
  end

  answer
end

substring("Howdy partner, sit down! How's it going?", dictionary)
