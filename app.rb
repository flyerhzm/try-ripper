require 'sinatra'
require 'haml'
require 'ripper'
require 'sorcerer'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  @source = "ruby"
  haml :index
end

post '/' do
  @code = params["code"]
  @source = params["source"]
  if @source == "ruby"
    begin
      @result = Ripper::SexpBuilder.new(@code).parse
    rescue
      @alert = "not valid ruby code"
    end
  else
    begin
      @result = Sorcerer.source(eval(@code))
    rescue
      @alert = "not valid sexp"
    end
  end
  haml :index
end
