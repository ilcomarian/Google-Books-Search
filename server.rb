 require "sinatra"
 require "googlebooks"
 require "sinatra/reloader"
 select = nil

get "/" do
    erb :layout
   end

 post "/" do
  @select = params[:query]
  books = GoogleBooks.search(@select)
  first_book = books.first
  @author = first_book.authors
   @img =  first_book.image_link(:curl => true)
   @info = first_book.info_link
   @title = first_book.title
   erb :show
   end
 

#  books = GoogleBooks.search('The Great Gatsby')
# first_book = books.first
# "#{first_book.authors}"
#  @author = first_book.authors
#  @img =  first_book.image_link
#  erb :show
