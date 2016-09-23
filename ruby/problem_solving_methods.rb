#Omar and Tae - 5.6

#sample array
array = [3,55,100,1500,98,2,1]


def simple_search(arr , value)
#    arr.select {|i| i == value ; p arr[i]}
    counter = 0
    found = false

    arr.each do |i|
        while counter < arr.length
            if value == arr[counter]
                return counter
                found = true
            else
                #triggers the found variable if value not in array
                found = false
            end
        counter += 1
        end
    end

    #returns nil if number is not found in array
    if found == false
        return nil
    end

end
