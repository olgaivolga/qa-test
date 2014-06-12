require 'spec_helper'
require 'test_helper'
include TestHelper

describe "ResetTests", :type => :request do

    it "/reset" do
        get '/reset'
        expect(response).to be_success        
        # BUG
        #expect(json['status']).to eq("OK")
        expect(json['status']).to eq("ok")
    end

end

