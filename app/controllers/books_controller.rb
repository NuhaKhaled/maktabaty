class BooksController < ApplicationController
  # GET /books
  # GET /books.json
    def create
    @user = User.find(current_user.id)
    @book = @user.books.create(params[:book])
    redirect_to user_path(@user)
  end



 def destroy
    @user = User.find(current_user.id)
    @book = @user.books.find(params[:id])
    @book.destroy
    redirect_to user_path(@user)
  end

  def edit
     #   @book = Book.find(params[:id])
     #   @user = @book.user
     @user = User.find(current_user.id)
     @book = @user.books.find(params[:id])
end

def update
     @user = User.find(current_user.id)
     @book = @user.books.find(params[:id])
   # @book = Book.find(params[:id])
   # @user = @book.user
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@user, :notice => 'book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end

end
end