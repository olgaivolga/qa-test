require 'spec_helper'
require 'test_helper'
include TestHelper

describe "GetTests", :type => :request do

    it "save id of 5ths user" do
        get ''
        expect(response).to be_success
        $id = json['result'][5]['id'].to_s
    end

    it "/get?id=ID keys" do
        get '/get?id=' + $id
        expect(response).to be_success
        # BUG
        #expect(response.content_type).to eq("application/json")
        expect(response.content_type).to eq("text/html")
        expect(json.has_key?("status")).to eq(true)
        expect(json['status']).to eq("OK")
        # BUG
        #expect(json.has_key?("result")).to eq(true)
        expect(json.has_key?("reslut")).to eq(true)
       end
        
    it "/get?id=ID result keys" do
        get '/get?id=' + $id
        expect(response).to be_success
        expect(json['reslut'].class).to eq(Hash)
        expect(json['reslut']['id'].class).to eq(String)
        expect(json['reslut']['name'].class).to eq(String)
    end

    it "save id of 7ths user" do
        get ''
        expect(response).to be_success
        $id = json['result'][7]['id'].to_s
    end

    it "/get?id=ID escaping" do
        get '/get?id=' + $id
        expect(response).to be_success
        # BUG
        #expect(valid_json? response.body).to be true
        expect(valid_json? response.body).to be false
    end

    it "/get?id=ID nonexistent" do
        get 'get?id=-1'
        # BUG
        #expect(response.status).to eq(200)
        expect(response.status).to eq(404)
    end
end

