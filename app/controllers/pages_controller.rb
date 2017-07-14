class PagesController < ApplicationController

  before_action :pages_append_view_path

  def index
    @pages = Page.ordered
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find params[:id]
  end

  def create
    @page = Page.new page_params
    if @page.save
      #TODO: set flash message?
      redirect_to edit_page_url(@page.id)
    else
      render 'new'
    end
  end

  def update
    @page = Page.find params[:id]
    if @page.update(page_params)
      #TODO: set flash message?
      redirect_to edit_page_url(@page.id)
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_url
  end

  protected

  def pages_append_view_path
    append_view_path IvaldiContentBuilder::Engine.root.join('app', 'views')
  end

  def page_params
    ret = params.require(:page).permit!
  end

end