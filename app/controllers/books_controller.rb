class BooksController < ApplicationController
    def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to book_path(book.id)
    end
    
    def index
        @books = Book.all
        
        @user_info = current_user
        @book_new = Book.new
    end
    
    def show
         @book = Book.find(params[:id])
        
        @user_info = @book.user
        @book_new = Book.new
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path(book.id)
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
    
    private
    
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
