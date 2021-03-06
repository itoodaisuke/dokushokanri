class BooksController < ApplicationController
  include ApplicationHelper
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user.books.all
    @books = current_user.books.order('id desc').limit(5)
  end

  def show
    @req = request.fullpath
  end

  def new
    @book = Book.new(book_params)
    @book.publishers.build
    @book.authors.build
    @book.readings.build

    @asin = params[:book][:asin].to_s
    if @asin.present?
      @rec = get_amazon_item_data(@asin)
    end
  end

  def search
    @book = Book.new
    @book.publishers.build
    @book.authors.build
    @book.readings.build

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
       }
      end
    else
      render "new"
      return
    end
    render "new"
  end

  def edit
    @edit = request.path_info
    @rec = @book
  end

  def create
    raw = book_params
    data = plural_save(raw)
    @book = Book.new(data)
    @book.user = current_user

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
    def book_params
      params.fetch(:book, {}).permit(
        :user_id,
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
        authors_attributes: [:id, :name],
        readings_attributes: [:id, :comment, :started_on, :finished_on]
      )
    end

    def set_book
      @book = Book.find(params[:id])
    end
end
