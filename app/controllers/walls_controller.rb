class WallsController < ApplicationController
  def index
    if session[:id]
      @walls = Wall.all
    else
      redirect_to '/signin'
    end
  end

  def show
    @wall = Wall.find params[:id]
    @posts = @wall.posts.reverse
    @post = Post.new
    @error = flash[:access_errors]
    if session[:id]
      if Membership.find_by_user_id_and_wall_id(session[:id], @wall.id)
        render :show
      else
        redirect_to new_wall_membership_path(@wall, @membership)
        #redirect_to '/walls/' + @wall.id.to_s + '/memberships/new'
      end
    else
      redirect_to '/signin'
    end
  end

  def new
    if session[:id]
      @wall = Wall.new
      @user_id = session[:id]
    else
      redirect_to '/signin'
    end
  end

  def create
    if session[:id]
      @wall = Wall.new params[:wall]
      if @wall.save
        Membership.create(wall_id: @wall.id, user_id: session[:id])
        redirect_to wall_path(@wall)
      else
        render :new
      end
    else
      redirect_to '/signin'
    end
  end

  def edit
    if session[:id]
      @wall = Wall.find params[:id]
    else
      redirect_to '/signin'
    end
  end

  def update
    @wall = Wall.find params[:id]
    if @wall.update_attributes params[:wall]
      redirect_to wall_path(@wall)
    else
      render :edit
    end
  end

  # def access
  #   wall = Wall.find(params[:wall_id])
  #   if params[:access_code] = wall.access_code
  #     Membership.create(wall_id: wall.id, user_id: session[:id])
  #   end
  #   render :show
  # end

  def destroy
    @wall = Wall.find params[:id]
    @wall.destroy
    redirect_to root_path
  end
end