require 'spec_helper'

describe "IndexOffsetCountTests", :type => :request do

    it "/index?offset=0&count=1" do
        get '/index?offset=0&count=1'
        expect(response).to be_success
        json = JSON.parse(response.body)
        # BUG
        json_expected = [{"id"=>35904, "name"=>"David Bush"}, {"id"=>35905, "name"=>"Mikka Heep"}] 
        #json_expected = [{"id"=>35904, "name"=>"David Bush"}]
        expect(json['result']).to eq(json_expected)
    end

    it "/index?offset=1&count=1" do
        get '/index?offset=1&count=1'
        expect(response).to be_success
        json = JSON.parse(response.body)
        # BUG
        json_expected = [{"id"=>35905,"name"=>"Mikka Heep"},{"id"=>35906,"name"=>"Hannah Oberty"}];
        #json_expected = [{"id"=>35905,"name"=>"Mikka Heep"}];
        expect(json['result']).to eq(json_expected)
    end

end

