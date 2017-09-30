class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if user_signed_in?
      @books = Book.for_last_period
                   .visible_for_user(current_user.id)
                   .order_by_young
                   .page(params[:page])
                   .per(6)
    else
      @books = Book.for_last_period
                   .visible_for_guest
                   .order_by_young
                   .page(params[:page])
                   .per(6)
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    unless user_signed_in?
      flash[:notice] = t('books.message.access.error')
      redirect_to root_path and return
    end
    @book = Book.new
    @book.user_id = current_user.id
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title,
                                   :user_id,
                                   :image,
                                   :summary,
                                   :draft,
                                   :author,
                                   { genre_ids: [] }
      )
    end

    def require_user
      return if user_signed_in? && @book.owner_book?(current_user.id)

      flash[:notice] = t('books.message.access.error')
      redirect_to root_path
    end

end
