class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index
  
  def index
    #@admins = Admin.all
    #@admins = Admin.with_restricted_access
    @admins = policy_scope(Admin)
  end
  
  def new
    @admin = Admin.new
    authorize @admin
  end
  
  def create
    @admin = Admin.new(params_admin)
    
    if @admin.save 
        redirect_to backoffice_admins_path, notice: "Administration (#{@admin.email}) save successful"
    else
       render :new
    end
  end
  
  def edit
  end
  
  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Administration (#{@admin.email}) update successful"
    else
      render :edit
    end
  end
  
  def destroy
    authorize @admin
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Administration (#{admin_email}) destroy successful"
    else
      render :index
    end
  end
  
  private
  
    def set_admin
      @admin = Admin.find(params[:id])
    end
    
    def params_admin
      
      pass = params[:admin][:password]
      pass_confirm = params[:admin][:password_confirmation]
      
       if pass.blank? && pass_confirm.blank? 
         params[:admin].except!(:password, :password_confirmation)
       end
       
       if @admin.blank?
         params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
       else
         params.require(:admin).permit(policy(@admin).permit_attr)
       end
    
    end

end
