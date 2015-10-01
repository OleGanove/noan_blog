class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  
  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 9)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)

  	if @post.save
  	  redirect_to @post, notice: "Hell ya, #{current_user.username}, der Artikel wurde supi gespeichert."
  	else
  	  render 'new', notice: "Oh no, #{current_user.username}, der Artikel konnte nicht gespeichert werden."
  	end
  end 

  def show
    @user = @post.user
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  	  redirect_to @post, notice: "Huzzah, #{current_user.username}! Der Artikel wurde aktualisiert!"
  	else
  	  render 'edit'
  	end
  end

  def destroy 
  	@post.destroy
  	redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end

    def find_post 
      @post = Post.friendly.find(params[:id])
    end

end
