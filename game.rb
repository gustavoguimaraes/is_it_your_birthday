require 'bundler'
Bundler.require



module Game
 class Is_Birthday_App < Sinatra::Application

    before do 
      @count_today = Time.new
      @count_birthday = {"tara" => Time.new(2014,7,27), "roberta" => Time.new(2014,10,30), "jen" => Time.new(2014,11,13),"rachel"=> Time.new(2014,11,13),"sandy" => Time.new(2014,3,15), "gustavo" => Time.new(2014,9,19),"baby jesus" => Time.new(2013,12,25)}
      @today = Date.today.strftime("%m/%d")
      @birthday = {"tara" =>"07/27", "roberta" => "10/30", "jen" => "11/13","rachel"=> "11/13","sandy" => "3/15", "gustavo" => "9/19", "baby jesus"=> "12/25"} 

    end
    
    get'/' do 
      erb :homepage
    end

    get'/:person' do
      @person = params[:person]
      if @today== @birthday 
        if @person == "baby jesus"
        @image = "xmas"
        @result = "Yes, so Merry Christmas!"
        else
          @image = "birthday"
          @result = "Yes! Happy Birthday #{@person}"
        end 
      else
        @result = "NO"
        @countdown_days = "#{((((@count_birthday[@person].to_i - @count_today.to_i)/60)/60)/24)+1}" 
        @countdown_hours = "#{((@count_birthday[@person].to_i - @count_today.to_i)/60)/60}" 
        @countdown_minutes = "#{((@count_birthday[@person].to_i - @count_today.to_i)/60)}"
        @countdown_seconds = "#{(@count_birthday[@person].to_i - @count_today.to_i)}"
      end
      erb :index
    end

    get '/:person/pretend' do
      @person = params[:person]
      if @person == "baby jesus"
        @image = "xmas"
        @result = "Yes, so Merry Christmas!"
        erb :pretend
      else
      @image = "birthday" 
      @result = "YESSS" 
      erb :pretend  
      end
    end
    
    helpers do 
      def simple_partial(template)
        erb template
      end
    end

 end
end