require 'spec_helper'
require 'test_helper'
include TestHelper

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
        json_result = remove_ids(json['result'])
        json_result_expected = [{"id"=>0,"name"=>"David Bush"},
                        {"id"=>0,"name"=>"Mikka Heep"},
                        {"id"=>0,"name"=>"Hannah Oberty"},
                        {"id"=>0,"name"=>"Petula Jackson"},
                        {"id"=>0,"name"=>"Clark Peterson"},
                        {"id"=>0,"name"=>"Betty Williamson"},
                        {"id"=>0,"name"=>"John Doe"},
                        {"id"=>0,"name"=>"John \"Fireman\" Smith"},
                        {"id"=>0,"name"=>"Harrison Ford"},
                        {"id"=>0,"name"=>"Bob Dowson"}]
        expect(json_result.length).to eq(10)
        expect(json_result).to eq(json_result_expected)
    end

=begin
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
        get '/get?id=35914' 
        expect(response).to be_success
        json = JSON.parse(response.body)
#        puts json.class
#        puts YAML::dump(json)
        json_expected = {"id" => "35913", "name" => "Bob Dowson"}
        expect(json['reslut']).to eq(json_expected)
    end
=end

end

