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
  @code = params["code"]
  sexp = Ripper::SexpBuilder.new(@code).parse
  @result = ""
  @indent = -1
  parse(sexp)
  haml :index
end

def parse(nodes)
  @indent += 1
  nodes.each do |node|
    if node.is_a? Array
      parse(node)
    else
      @result << "&nbsp;" * @indent * 2
      @result << output(node)
      @result << "<br/>"
    end
  end
  @indent -= 1
end

def output(node)
  case node
  when NilClass
    "nil"
  when Symbol
    "<span class='red'>:#{node.to_s}</span>"
  when Fixnum
    "<span class='blue'>#{node.to_s}</span>"
  else
    node.inspect
  end
end
