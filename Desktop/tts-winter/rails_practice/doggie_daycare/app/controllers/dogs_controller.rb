class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
  end
  def index
    @dogs = Dog.all
  end
  def new
    @dog = Dog.new
  end
 def create
   @dog = Dog.new(dog_params)
   if @dog.save
     redirect_to dogs_url, notice: "Dog saved!"
   else
     flash.now[:notice] = "Could not save dog. :("
     render :new
   end
 end

   def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      redirect_to dog_url(@dog), notice: "Dog updated!"
    else
      flash.now[:notice] = "Could not update dog :("
      render :edit
    end
  end
  def destroy
    @dog = Dog.find(params[:id])

    if @dog.destroy
      redirect_to dogs_url, notice: "Successfully deleted!"
    else
      redirect_to dogs_url, notice: "Could not delete dog."
    end
  end


 private

 def dog_params
   params.require(:dog).permit(:name, :breed, :age, :owner)
 end

end