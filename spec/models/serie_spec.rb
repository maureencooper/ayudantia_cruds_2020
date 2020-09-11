require 'rails_helper'

RSpec.describe Serie, type: :model do
  #Crear context con los test de datos incorrectos.
  it "difisfhdso" do
    serie = Serie.new(:puntuacion => 9, :comentario => "sjdosads")
    expect(serie).not_to be_valid
  end
  '''
  it "difisfhdso2" do
    serie = Serie.new(:nombre => "dsads", :puntuacion => 9, :comentario => "sjdosads").save
    expect(serie).to be_valid
  end
  

  it "does not change the serie, and re-renders the form" do
    serie = Serie.new({:nombre => "Test_serie", :puntuacion => "rf", :comentario => "sjdosads"})
    expect(serie).to_not be_valid
  end 
  '''
  
  it "does not change the serie, and re-renders the form" do
    serie = Serie.new({:nombre => "Test_serie", :puntuacion => 100, :comentario => "sjdosads"})
    expect(serie).to_not be_valid
  end 
end
