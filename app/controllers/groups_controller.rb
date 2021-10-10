class GroupsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def index
    @groups = Group.all
    @group = Group.new
  end
  
  def show
    @group = Group.find(params[:id])
    @group_post = GroupPost.new
    @group_posts = @group.group_posts
  end
  
  def join
    @group = Group.find(params[:id])
    @group.customers << current_customer
    redirect_to  groups_path
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    @group.customers << current_customer
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
  
  def ensure_correct_customer
    @group = Group.find(params[:id])
    unless @group.owner_id == current_customer.id
      redirect_to groups_path
    end
  end
end
