require 'helper'

def app
  Potatochop::Web
end

describe 'Potatochop' do
  describe 'Web' do
    app.set('working_dir','/Users/mertonium/Code/potatochop/spec/fake_site')
    include Rack::Test::Methods

    it 'returns an error when a haml page does not exist' do
      get 'no_exist.html'
      last_response.should_not be_ok
    end

    it 'renders a haml page that exists' do
      get '/foo.html'
      last_response.body.should match('<h1>\s+This is an H1!\s+</h1>')
    end

    it 'returns an error when a sass file does not exist' do
      get 'no_exist.css'
      last_response.should_not be_ok
    end

    it 'renders a haml page that exists' do
      get '/css/foo.css'
      last_response.body.should match('body h1 {\s+color: red; }')
    end

    it 'returns an error when a requested image file does not exist' do
      get 'no_exist.png'
      last_response.should_not be_ok
    end

    it 'returns a requested image file when it exists' do
      get '/img/potatochop_cs4_box.png'
      last_response.should be_ok
    end

  end
end