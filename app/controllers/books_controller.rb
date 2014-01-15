class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @search_form = SearchForm.new params[:search_form]
    @books = Book.all
    if @search_form.q.present?
      @books = @books.titled @search_form.q
    end
  end

  def show
  end

  def new
    @book = Book.new
    @book.publishers.build
    @book.authors.build

    respond_to do |format|
      format.html
    end

  end

  def search
    @book = Book.new
    @book.publishers.build
    @book.authors.build

    @keyword = params[:keyword]
    if @keyword.present?
      Amazon::Ecs.debug = true
      @res = Amazon::Ecs.item_search(params[:keyword], 
         :search_index => 'All', :response_group => 'Medium')
      @datalist = []
      @res.items.each do |item|
       element = item.get_element('ItemAttributes')
       @datalist << {
         :page => item.get('DetailPageURL'),
         :asin => item.get('ASIN'), 
         :title => element.get("Title"), 
         :isbn => element.get("ISBN"), 
         :author => element.get_array("Author").join(", "), 
         :product_group => element.get("ProductGroup"), 
         :publisher => element.get("Manufacturer"), 
         :publication_date => element.get("PublicationDate"), 
         :s_image => item.get("SmallImage/URL"), 
         :m_image => item.get("MediumImage/URL"), 
         :l_image => item.get("LargeImage/URL"), 
         # # URL, Width, Heightの要素を持っている
         # :small_image_hash => item.get_hash("SmallImage"), 
         # :medium_image_hash => item.get_hash("MediumImage"), 
         # :large_image_hash => item.get_hash("LargeImage"),
       }
      end
    else
      render "new"
      return
    end
    render "new"
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.publishers.build
    @book.authors.build
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    def book_params
      params.require(:book).permit(
        :page,
        :id,
        :title,
        :isbn,
        :asin,
        :author,
        :product_group,
        :publisher,
        :publication_date,
        :s_image,
        :m_image,
        :l_image,
        publishers_attributes: [:id, :name],
        authors_attributes: [:id, :name]
      )
    end

    def set_book
      @book = Book.find(params[:id])
    end
end
