class Admin::InsuranceTypesController < ApplicationController
  layout 'admin', :except => [:show]
  before_action :authenticate_user!
  before_action :set_insurance_type, only: [:show, :edit, :update, :destroy]

  def index
    @insurance_types = InsuranceType.all.decorate
  end


  def show
  end

  
  def new
    @insurance_type = InsuranceType.new
  end


  def edit
  end


  def create
    @insurance_type = InsuranceType.new(insurance_type_params)

    respond_to do |format|
      if @insurance_type.save
        format.html { redirect_to admin_insurance_types_path(@insurance_type), notice: 'Insurance type was successfully created.' }
        format.json { render :show, status: :created, location: @insurance_type }
      else
        format.html { render :new }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @insurance_type.update(insurance_type_params)
        format.html { redirect_to admin_insurance_types_path(@insurance_type), notice: 'Insurance type was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_type }
      else
        format.html { render :edit }
        format.json { render json: @insurance_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    binding.pry
    @insurance_type.soft_delete
    respond_to do |format|
      format.html { redirect_to admin_insurance_types_url, notice: 'Insurance type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_insurance_type
      @insurance_type = InsuranceType.find(params[:id]).decorate
    end


    def insurance_type_params
      params.require(:insurance_type).permit(:name, :description, :parent_id)
    end
end
