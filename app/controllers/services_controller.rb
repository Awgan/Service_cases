class ServicesController < ApplicationController
  
	@@technicians = Hash[ "Brak"=>"Brak", "AG"=>"Andrzej G.", "MG"=>"Michał G.", "RS"=>"Rafał Sz.", "KM"=>"Krzysztof M.",
	"KR"=>"Krzysztof R", "JM"=>"Jarosław M", "MA"=>"Mariusz A." ]

	@@status = {
    czeka:"Czeka",
    realizacja:"Realizacja",
    fakturowanie:"Fakturowanie"
  }

  def index
  	@services = Service.all
  	@techs = @@technicians
  end

  def show
  	@service = Service.find(params[:id])
  	@techs = @@technicians
  end

  def new
  	@servicee = Service.new
  	@techs = @@technicians
  	@stat = @@status
  end

  def create
  	@service = Service.new(data_zgloszenia: params[:service][:data_zgloszenia], numer: params[:service][:numer], status: params[:service][:status], przydzial: params[:service][:przydzial], klient: params[:service][:klient], miasto: params[:service][:miasto], opis: params[:service][:opis])
  	
  	if @service.save
  		redirect_to "/services"
  	else
  		render :new
  	end

  end

  def edit
  	@service = Service.find(params[:id])
  	@techs = @@technicians
  	@stat = @@status
  end

  def update
  	@service = Service.find(params[:id])
  	
  	
	if @service.update(data_zgloszenia: params[:service][:data_zgloszenia], numer: params[:service][:numer], status: params[:service][:status], przydzial: params[:service][:przydzial], klient: params[:service][:klient], miasto: params[:service][:miasto], opis: params[:service][:opis])

		redirect_to "/services/#{@service.id}"
	else
		render :edit
	end

  end

  def koniec
  	@service = Service.find(params[:id])
    
    #redirect_to root_path

  end

  def destroy
    @service = Service.find(params[:id])
    @posum = params[:service][:podsumowanie]
    @email_number = @service.numer.delete('/')

    if @service.destroy
      PodsumowanieMailer.with(service_sym: @service, podsum: @posum, line_num: @email_number).raport.deliver_now

      redirect_to "/"
    else
      render :koniec
    end
  
  end

  def week_summary_email 
    
    PodsumowanieMailer.week_summary.deliver_now

  end

  def logowanie

  end

  def piaskownica
  	@services = Service.all
  end

  def file_read
    file = File.open("../plik_testowy_01")
    file_read = file.read()

    @file_data = file_read.split("\n")


    file_data_num = @file_data.size

    for i in (0..file_data_num-1) do
      file_parts = @file_data[i].split(';') #Split to array 
      @service = Service.new(data_zgloszenia: file_parts[0], numer: file_parts[1], status: file_parts[4], przydzial: file_parts[5], klient: file_parts[2], miasto: file_parts[3], opis: file_parts[6])
      @service.save
    end

    file.close()

  end

private

  def service_params
    params.require(:service).permit(:data_zgloszenia, :numer, :klient, :miasto, :opis, :status, :przydzial)
  end

end
