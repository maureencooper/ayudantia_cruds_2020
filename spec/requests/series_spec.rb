require 'rails_helper'

RSpec.describe "Series", type: :request do
  describe "GET /series/index" do
    it "should return a succesful request" do
      get series_index_path
      expect(response).to have_http_status(200)
    end
    it "should render index view" do
      get series_index_path
      expect(response).to render_template(:index)
    end
  end

  describe "POST /series/:id" do
    it "create a serie and redirect to serie's page with the notice" do
      get series_new_path
      expect(response).to render_template(:new)

      post series_path, :params => {:serie => {:nombre => "Test_serie", :puntuacion => 9, :comentario => "sjdosads"}}
      expect(response).to redirect_to(series_index_path)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Serie agregada exitosamente.")
    end
  end

  describe "PATCH #update" do
    it "updates a specific serie and redirects" do
      serie = Serie.create({:nombre => "Test_serie", :puntuacion => 9, :comentario => "sjdosads"})
      patch serie_update_path(serie.id), :params => {:serie => {:nombre => "PhineasYFerb", :puntuacion => 9, :comentario => "sjdosads"}}
      expect(response).to be_redirect
    end
    '''
    context "with bad data" do
      it "does not change the serie, and re-renders the form" do
        serie = Serie.create({:nombre => "Test_serie", :puntuacion => 9, :comentario => "sjdosads"})
        patch serie_update_path(serie.id), :params => {:serie => {:nombre => "Test_serie", :puntuacion => "9", :comentario => "sjdosads"}}
        expect(response).not_to redirect_to serie_path(params[:id])
      end
    end
    '''
  end
end
