require 'pry'
require 'sinatra'

require './favourite_language_finder'

get '/' do
  slim :form
end

post '/' do
  @lang = FavouriteLanguageFinder.new(params[:name]).most_used
  slim :results
end

__END__

@@layout
doctype html
html
  head
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  body
    hr
    .container.text-center
      .col-md-12
        == yield

@@form
form.input-group method="post"
  input.form-control type="text" name="name" placeholder="Github username"
  .input-group-btn
    input.btn.btn-secondary type="submit" value="Send"

@@results
h1 Your favourite language is #{@lang}

