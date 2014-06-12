module TestHelper

    def valid_json?(json)
        begin
            JSON.parse(json)
            return true
        rescue JSON::ParserError 
            return false
        end
    end

    def json
        @json ||= JSON.parse(response.body)
    end

    def json_result
        @json_result ||= remove_ids(json['result'])
    end

    def remove_ids(json)
        new_json = []        
        json.each do |record|
            record.each do |key,value|
                if key=="id"
                    # Ignore id value type until it is fixed.
                    #record[key].replace "0"
                    record[key] = "0"
                end
            end
            new_json.push(record)
        end
        return new_json
    end
end


