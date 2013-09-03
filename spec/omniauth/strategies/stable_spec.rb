require 'spec_helper'

describe OmniAuth::Strategies::Stable do
  let(:access_token) { double('AccessToken', options: {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', parsed: parsed_response) }

  subject(:strategy) { described_class.new({}) }

  before do
    strategy.stub(:access_token) { access_token }
  end

  context "client options" do

    let(:client_options) { subject.options.client_options }

    it 'have the correct site' do
      expect(client_options.site).to eq("https://stable.bignerdranch.com")
    end

    it 'have the correct authorize url' do
      expect(client_options.authorize_url).to eq('/oauth/authorize')
    end

    it 'have  the correct token url' do
      expect(client_options.token_url).to eq('/oauth/token')
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      expect(access_token).to receive(:get).with('/users/me.json') { response }
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

  context "#email" do
    it 'returns email from raw_info if available' do
      strategy.stub(:raw_info) { { 'email'  => 'email@example.com' } }
      expect(strategy.email).to eq('email@example.com')
    end

    it 'returns a blank string when there is no email in the raw_info' do
      strategy.stub(:raw_info) { {} }
      expect(strategy.email).to eq('')
    end
  end

  context "#full_name" do
    it 'returns full_name from raw_info if available' do
      strategy.stub(:raw_info) { { 'full_name'  => 'Taco Man' } }
      expect(strategy.full_name).to eq('Taco Man')
    end

    it 'returns a blank string when there is no full_name in the raw_info' do
      strategy.stub(:raw_info) { {} }
      expect(strategy.full_name).to eq('')
    end
  end
end
