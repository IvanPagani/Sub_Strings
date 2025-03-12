def substrings(inputString, stringArray, overlap=false)

    unless overlap

        # Creates a Hash called "result"
        # Each "subStr" is a "key" and the respective "values" are default "0"
        stringArray.reduce(Hash.new(0)) do |result, subStr|

            numberOccurrences = inputString.downcase.scan(subStr).length
            if numberOccurrences != 0
                result[subStr.to_sym] = numberOccurrences
            end    
            result
        end
    else
        result = Hash.new(0)
        stringArray.each do |subStr|

            searchRange = (0..(inputString.length - subStr.length))

            # compare step by step the "inputString" with the "subStr"
            indexOccurrences = searchRange.select do |index|
                inputString.downcase[index, subStr.length] == subStr
            end
            
            if indexOccurrences.length != 0
                result[subStr.to_sym] = indexOccurrences.length
            end
        end
        result
    end
end

dictionary = ["ana","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#substrings("Howdy partner, sit down! How's it going?", dictionary)
#substrings("Howdy partner, sit down! How's it going?", dictionary, true)
#substrings("Banana banana. Banana?", dictionary)
substrings("Banana banana. Banana? Banana!", dictionary, true)