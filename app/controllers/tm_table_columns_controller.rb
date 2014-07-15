class TmTableColumnsController < ApplicationController
  before_action :set_tm_table_column, only: [:show, :edit, :update, :destroy]

  # GET /tm_table_columns
  # GET /tm_table_columns.json
  def index
    @tm_table_columns = TmTableColumn.all
  end

  # GET /tm_table_columns/1
  # GET /tm_table_columns/1.json
  def show
  end

  # GET /tm_table_columns/new
  def new
    @tm_table_column = TmTableColumn.new
  end

  # GET /tm_table_columns/1/edit
  def edit
  end

  # POST /tm_table_columns
  # POST /tm_table_columns.json
  def create
    @tm_table_column = TmTableColumn.new(tm_table_column_params)

    respond_to do |format|
      if @tm_table_column.save
        format.html { redirect_to @tm_table_column, notice: 'Tm table column was successfully created.' }
        format.json { render :show, status: :created, location: @tm_table_column }
      else
        format.html { render :new }
        format.json { render json: @tm_table_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tm_table_columns/1
  # PATCH/PUT /tm_table_columns/1.json
  def update
    respond_to do |format|
      if @tm_table_column.update(tm_table_column_params)
        format.html { redirect_to @tm_table_column, notice: 'Tm table column was successfully updated.' }
        format.json { render :show, status: :ok, location: @tm_table_column }
      else
        format.html { render :edit }
        format.json { render json: @tm_table_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tm_table_columns/1
  # DELETE /tm_table_columns/1.json
  def destroy
    @tm_table_column.destroy
    respond_to do |format|
      format.html { redirect_to tm_table_columns_url, notice: 'Tm table column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tm_table_column
      @tm_table_column = TmTableColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tm_table_column_params
      params.require(:tm_table_column).permit(:column_number, :column_name, :column_name_jp, :column_type, :column_size, :column_null, :column_default, :column_p_key, :column_f_key, :note, :tm_table_id)
    end
end
