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
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
    # アクセス権限に関する記述追加
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
  　else
  　  @books = Book.find(params[:id])
  　  render:edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
