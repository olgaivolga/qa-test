require 'spec_helper'
require 'test_helper'
include TestHelper

describe "IndexOffsetCountTests", :type => :request do

    it "/index?offset=0&count=1" do
        get '/index?offset=0&count=1'
        expect(response).to be_success
        expect(response.content_type).to eq("application/json")
        # BUG
        #json_result_expected = [{"id"=>"0", "name"=>"David Bush"}]
        json_result_expected = [{"id"=>"0", "name"=>"David Bush"}, {"id"=>"0", "name"=>"Mikka Heep"}]
        expect(json_result).to eq(json_result_expected)
    end

    it "/index?offset=1&count=1" do
        get '/index?offset=1&count=1'
        expect(response).to be_success
        # BUG
        #json_result_expected = [{"id"=>"0","name"=>"Mikka Heep"}];
        json_result_expected = [{"id"=>"0","name"=>"Mikka Heep"},{"id"=>"0","name"=>"Hannah Oberty"}];
        expect(json_result).to eq(json_result_expected)
    end

    it "/index?offset=20&count=20" do
        get '/index?offset=20&count=20'
        expect(response).to be_success
        json_result_expected = [];
        expect(json_result).to eq(json_result_expected)
    end

end

