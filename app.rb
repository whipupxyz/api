require 'sinatra'
require 'sinatra/reloader'
require 'active_support/inflector'
require 'json'
require 'faker'

get '/get/:resource' do
  content_type :json
  resource = params[:resource]
  count = params[:count]
  fields = []
  params[:fields].to_s.split('|').each do |f|
    fields.push(f.split("~"))
  end
  {resource: resource, count: count, fields: fields}.to_json
end