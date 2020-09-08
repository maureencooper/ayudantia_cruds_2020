class SeriesController < ApplicationController
  def new
    @serie = Serie.new 
  end

  def create
    @series_params = params.require(:serie).permit(:nombre, :puntuacion, :comentario)
    @serie = Serie.create(@series_params)

    if @serie.save
      redirect_to series_new_path, notice: "Serie agregada exitosamente."
    else
      redirect_to series_new_path, notice: "Error al guardar serie"
    end
  end

  def index
    @series = Serie.all
  end

  def show
    @serie = Serie.find(params[:id]) #Tambien existe el metodo "where" que puede ser muy util, te recomiendo buscarlo.
  end

  def edit
    @serie = Serie.find_by('id = ?', params[:id])
  end

  def update
    @serie = Serie.find(params[:id])
    @series_params = params.require(:serie).permit(:nombre, :puntuacion, :comentario)

    if @serie.update(@series_params)
      redirect_to serie_path(params[:id]), notice: 'Serie actualizada!' #Notar que params[:id] == @serie.id
    else
      redirect_to series_edit(@serie.id), notice: "Error al actualizar serie :("
    end
  end

  def destroy
    @serie = Serie.find(params[:id])
    @serie.destroy
    redirect_to series_index_path, notice: 'Serie eliminada con exito!'
  end

end
