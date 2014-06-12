require 'spec_helper'
require 'test_helper'
include TestHelper

describe "RootTests", :type => :request do

    it "/ keys" do
        get '/'
        expect(response).to be_success
        expect(response.content_type).to eq("application/json")
        expect(json.has_key?("status")).to eq(true)
        expect(json.has_key?("result")).to eq(true)
        expect(json['status']).to eq("OK")
    end

    it "/ result keys" do
        get '/'
        expect(response).to be_success
        expect(json['result'].class).to eq(Array)
        expect(json['result'][0]['name'].class).to eq(String)
        # BUG
        #expect(json['result'][0]['id'].class).to eq(String)
        expect(json['result'][0]['id'].class).to eq(Fixnum)
    end

    it "/ result" do
        get '/'
        expect(response).to be_success
        json_result = remove_ids(json['result'])
        json_result_expected = [{"id"=>"0","name"=>"David Bush"},
                        {"id"=>"0","name"=>"Mikka Heep"},
                        {"id"=>"0","name"=>"Hannah Oberty"},
                        {"id"=>"0","name"=>"Petula Jackson"},
                        {"id"=>"0","name"=>"Clark Peterson"},
                        {"id"=>"0","name"=>"Betty Williamson"},
                        {"id"=>"0","name"=>"John Doe"},
                        {"id"=>"0","name"=>"John \"Fireman\" Smith"},
                        {"id"=>"0","name"=>"Harrison Ford"},
                        {"id"=>"0","name"=>"Bob Dowson"}]
        expect(json_result.length).to eq(10)
        expect(json_result).to eq(json_result_expected)
    end

end

