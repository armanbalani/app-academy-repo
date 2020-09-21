require 'byebug'

word = "forst" 
# => ["for", "fro", "orf", "ofr", "rof", "rfo"]


def anagram(word, target)
    chars = word.split("")
    permutated = chars.permutation.to_a.map(&:join).any? do |ele|
        ele == target
    end

end

def second_anagram(word, target)
    word_chars = word.split("")
    target_chars = target.split("")
    word_chars.each do |char|
        index = target_chars.find_index(char)
        target_chars.delete_at(index) if !index.nil?
    end
    target_chars.empty?
end
# debugger

# time complexity is n!
# time complexity is n for second_anagram
# time complexity is n log n for third_anagram, worse than second_anagram?
# time complexity is n for fourth_anagram with two hashes
# time complexity is n for fourth_anagram with 1 hash

def third_anagram(word, target)
    word_chars = word.split("").sort
    target_chars = target.split("").sort
    target_chars == word_chars
end

def fourth_anagram(word, target)
    return false if word.length != target.length
    hash = Hash.new(0)
    word.each_char do |char|
        hash[char] += 1
    end

    target.each_char do |char|
        hash[char] += 1
    end

    result = hash.keys.all? { |key| word.include?(key) && target.include?(key) }
    hash.values.sum == word.length + target.length && result

end

