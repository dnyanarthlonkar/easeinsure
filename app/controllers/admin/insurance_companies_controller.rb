class Admin::InsuranceCompaniesController < ApplicationController
	layout 'admin'
	before_action :authenticate_user!
  before_action :set_insurance_companies, only: [:edit, :update, :destroy, :show]
    
    load_and_authorize_resource

  def index
  	@insurance_companies = InsuranceCompany.all
  end

  def new
  	@insurance_company = InsuranceCompany.new
  end

  def create
     
     @insurance_company = InsuranceCompany.create(insurance_company_params)
     
     respond_to do |format|
       if @insurance_company.save   
         format.html { redirect_to admin_insurance_companies_path, notice: 'Insurance Company was successfully created.'  }
       else
         format.html { render :action => "new" }
       end
     end
  end

  def edit
    
  end

  def update
 
   @insurance_company =  @insurance_company.update(insurance_company_params)

    respond_to do |format|
      if @insurance_company
        format.html { redirect_to admin_insurance_companies_path, notice: 'Insurance Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end 

  def destroy
     @insurance_company.destroy
     respond_to do |format|
       format.html { redirect_to(admin_insurance_companies_path,  notice: 'Insurance Company was successfully deleted.') }
       format.xml  { head :ok }
     end
  end

  private 
    def set_insurance_companies
      @insurance_company = InsuranceCompany.find(params[:id])
    end 

    def insurance_company_params
      params.required(:insurance_company).permit(:company_name, :licence_no,:company_code, :company_address, :contact_number, 
      	:registration_code, :authorised_person_name, :authorised_person_contact_number, :authorised_person_contact_email, :designation, :status, :logo)
    end
end
