require 'spec_helper'

describe "APITests", :type => :request do

    it "GET keys" do
        get ''
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json.has_key?("status")).to eq(true)
        expect(json.has_key?("result")).to eq(true)
    end

    it "GET result" do
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

    it "GET /get?id=35913 keys" do
        get '/get?id=35913'
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json.has_key?("status")).to eq(true)
#        expect(json.has_key?("result")).to eq(true)
       end
        
    it "GET /get?id=35913 status" do
        get '/get?id=35913'
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json['status']).to eq("OK")
    end

    it "GET /get?id=35913 result value" do
        get '/get?id=35913' 
        expect(response).to be_success
        json = JSON.parse(response.body)
#        puts json.class
#        puts YAML::dump(json)
        user = {"id" => "35913", "name" => "Bob Dowson"}
#        expect(json['reslut'].length).to eq(2)
        expect(json['reslut']).to eq(user)
    end

    it "GET /index?offset=1" do
        get '/index?offset=1'
        expect(response.status).to eq(500) 
    end

    it "GET /index?count=1" do
        get '/index?count=1'
        expect(response.status).to eq(200)
    end

end

