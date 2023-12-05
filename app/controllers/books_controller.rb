class BooksController < ApplicationController
    def create
        book = Book.new(book_params)
        book.save
        # ユーザーの詳細に飛べない、コントローラーの設定してないからとか？
        redirect_to user_path
    end
    
    def index
        @book = Book.new
        
        @books = Book.all
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
