class BooksController < ApplicationController
  
  def index
  @book = Book.new
  @user = current_user
  @books = Book.all
  end
  
  def create
  @book = Book.new (book_params)
  @book.user_id = current_user.id
  # この記述でだれだれの記述として保存またはわかりやすくなる。
  @book.save
  redirect_to book_path(@book.id)
  
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
  end
  
   private

  def book_params
  params.require(:book).permit(:title, :body)
  end
  
end
