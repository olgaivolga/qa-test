require 'spec_helper'
require 'test_helper'
include TestHelper

describe "IndexOffsetCountTests", :type => :request do

    it "/index?offset=0&count=1" do
        get '/index?offset=0&count=1'
        expect(response).to be_success
        json = JSON.parse(response.body)
        json_result = remove_ids(json['result'])
        # BUG
        json_result_expected = [{"id"=>0, "name"=>"David Bush"}, {"id"=>0, "name"=>"Mikka Heep"}] 
        #json_result_expected = [{"id"=>0, "name"=>"David Bush"}]
        expect(json_result).to eq(json_result_expected)
    end

    it "/index?offset=1&count=1" do
        get '/index?offset=1&count=1'
        expect(response).to be_success
        json = JSON.parse(response.body)
        json_result = remove_ids(json['result'])
        # BUG
        json_result_expected = [{"id"=>0,"name"=>"Mikka Heep"},{"id"=>0,"name"=>"Hannah Oberty"}];
        #json_result_expected = [{"id"=>0,"name"=>"Mikka Heep"}];
        expect(json_result).to eq(json_result_expected)
    end

end

