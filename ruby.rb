def substrings(inputString, stringArray, overlap=false)

    unless overlap

        # Creates a Hash called "result"
        # Each "subStr" is a "key" and their respective "values" are default "0"
        stringArray.reduce(Hash.new(0)) do |result, subStr|
            numberOccurrences = inputString.downcase.scan(subStr).length
            result[subStr.to_sym] = numberOccurrences if numberOccurrences > 0  
            return result
        end

    else

        result = Hash.new(0)
        stringArray.each do |subStr|
            # mutate "indexArray" to have only the indexes where the "subStr" is found
            indexArray = (0..(inputString.length - subStr.length)).to_a
            indexArray.select! { |index| inputString.downcase[index, subStr.length] == subStr }
            
            numberOccurrences = indexArray.length
            result[subStr.to_sym] = numberOccurrences if numberOccurrences > 0
        end
        return result

    end
end

dictionary = ["ana","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#substrings("Howdy partner, sit down! How's it going?", dictionary)
#substrings("Howdy partner, sit down! How's it going?", dictionary, true)
#substrings("Banana banana. Banana? Banana!", dictionary)
substrings("Banana banana. Banana? Banana!", dictionary, true)