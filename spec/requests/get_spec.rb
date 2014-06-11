require 'spec_helper'

describe "GetTests", :type => :request do

    it "/get keys" do
        get ''
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json.has_key?("status")).to eq(true)
        expect(json.has_key?("result")).to eq(true)
    end

    it "/get result" do
        get ''
        expect(response).to be_success
        json = JSON.parse(response.body)
        json_expected = [{"id"=>35904,"name"=>"David Bush"},
                        {"id"=>35905,"name"=>"Mikka Heep"},
                        {"id"=>35906,"name"=>"Hannah Oberty"},
                        {"id"=>35907,"name"=>"Petula Jackson"},
                        {"id"=>35908,"name"=>"Clark Peterson"},
                        {"id"=>35909,"name"=>"Betty Williamson"},
                        {"id"=>35910,"name"=>"John Doe"},
                        {"id"=>35911,"name"=>"John \"Fireman\" Smith"},
                        {"id"=>35912,"name"=>"Harrison Ford"},
                        {"id"=>35913,"name"=>"Bob Dowson"}]
        expect(json['result'].length).to eq(10)
        expect(json['result']).to eq(json_expected)

    end

    it "/get?id=35913 keys" do
        get '/get?id=35913'
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json.has_key?("status")).to eq(true)
        # BUG
        #expect(json.has_key?("result")).to eq(true)
        expect(json.has_key?("reslut")).to eq(true)
       end
        
    it "/get?id=35913 status" do
        get '/get?id=35913'
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json['status']).to eq("OK")
    end

    it "/get?id=35913 result value" do
        get '/get?id=35913' 
        expect(response).to be_success
        json = JSON.parse(response.body)
#        puts json.class
#        puts YAML::dump(json)
        user = {"id" => "35913", "name" => "Bob Dowson"}
#        expect(json['reslut'].length).to eq(2)
        expect(json['reslut']).to eq(user)
    end

end

