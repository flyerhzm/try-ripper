require 'sinatra'
require 'haml'
require 'ripper'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  haml :index
end

post '/' do
  code = params["code"]
  @sexp = Ripper::SexpBuilder.new(code).parse
  haml :index
end
