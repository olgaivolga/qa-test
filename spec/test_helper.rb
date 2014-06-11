module TestHelper

    def remove_ids(json)
        new_json = []        
        json.each do |record|
            record.each do |key,value|
                if key=="id"
                    record[key] = 0 
                end
            end
            new_json.push(record)
        end
        return new_json
    end
end


