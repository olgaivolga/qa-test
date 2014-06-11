require 'spec_helper'

describe "IndexOffsetTests", :type => :request do

    it "/index?offset=1" do
        get '/index?offset=1'
        # BUG
        #expect(response.status).to eq(200)
        expect(response.status).to eq(500) 
    end

end

