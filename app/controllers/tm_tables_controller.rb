class TmTablesController < ApplicationController
  before_action :set_tm_table, only: [:show, :edit, :update, :destroy]

  # GET /tm_tables
  # GET /tm_tables.json
  def index
    @tm_tables = TmTable.all
  end

  # GET /tm_tables/1
  # GET /tm_tables/1.json
  def show
      @tm_table = TmTable.find(params[:id])
  end

  # GET /tm_tables/new
  def new
    @tm_table = TmTable.new
    @tm_table.tm_table_columns.build
  end

  # GET /tm_tables/1/edit
  def edit
  end

  # POST /tm_tables
  # POST /tm_tables.json
  def create
    @tm_table = TmTable.new(tm_table_params)

    respond_to do |format|
      if @tm_table.save
        format.html { redirect_to @tm_table, notice: 'Tm table was successfully created.' }
        format.json { render :show, status: :created, location: @tm_table }
      else
        format.html { render :new }
        format.json { render json: @tm_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tm_tables/1
  # PATCH/PUT /tm_tables/1.json
  def update
    respond_to do |format|
      if @tm_table.update(tm_table_params)
        format.html { redirect_to @tm_table, notice: 'Tm table was successfully updated.' }
        format.json { render :show, status: :ok, location: @tm_table }
      else
        format.html { render :edit }
        format.json { render json: @tm_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tm_tables/1
  # DELETE /tm_tables/1.json
  def destroy
    @tm_table.destroy
    respond_to do |format|
      format.html { redirect_to tm_tables_url, notice: 'Tm table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tm_table
      @tm_table = TmTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tm_table_params
      params.require(:tm_table).permit(:project_name, :table_name, :table_name_jp, :revision_number, :note,
        tm_table_columns_attributes: [:id, :column_number, :column_name, :column_name_jp, :column_type, :column_size, :column_null, :column_default, :column_p_key, :column_f_key, :note, :tm_table_id,:_destroy]
      )
    end
end
