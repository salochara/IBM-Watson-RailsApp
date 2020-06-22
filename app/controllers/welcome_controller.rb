class WelcomeController < ApplicationController
  include IBMWatson
  include WelcomeHelper

  before_action :start_service, only: [:index,:searchURL,:analyzeTextResult]

  def index
    @response = @natural_language_understanding.analyze(
        url: "www.ibm.com",
        features: {categories: {limit:10}}
    )
    @user = User.first
  end

  def sendURL
  end

  def rssElPais
    url = 'https://feeds.elpais.com/mrss-s/pages/ep/site/elpais.com/section/america/portada'
    feed = RSS::Parser.parse(url)

    @selectedItems = feed.items.take(20)
  end

  def rssSearch
    @response = searchURL
  end

  def searchURL
    # Get the URL the user searched for
    urlToSearch = params["link"]
    @response = @natural_language_understanding.analyze(
        url: "#{urlToSearch}",
        features: {categories: {limit:15}}
    )
    return @response
  end

  def sendAudio
  end


  def speechToText
    @user = User.first

    authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV["SPEECH_TO_TEXT_API_KEY"]
    )

    speech_to_text = SpeechToTextV1.new(
        authenticator: authenticator
    )

    speech_to_text.service_url = ENV['SPEECH_TO_TEXT_SERVICE_URL']

    upload
    mycallback = MyRecognizeCallback.new

    filename = params["audio"].original_filename
    File.open("storage/#{filename}") do |audio_file|
      @recognition = speech_to_text.recognize(
          audio: audio_file,
          content_type: "audio/wav",
          timestamps: true,
          word_confidence: true,
          model: "en-US_NarrowbandModel"
      ).result
      puts JSON.pretty_generate(@recognition)
    end

  end

  def sendTextAnalysis
  end



  def analyzeTextResult
    text = params["text"]

    @response = @natural_language_understanding.analyze(
        text: text,
        features: {
            "entities" => {},
            "keywords" => {}
        }
    ).result

  end


  def upload
    uploaded_file = params[:audio]
    File.open(Rails.root.join('storage', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end

  private

  # Method for starting service. IAM authentication
  def start_service

    url = ENV["NLU_URL"]
    authenticator = Authenticators::IamAuthenticator.new(
        apikey: ENV["NLU_API_KEY"]
    )

    @natural_language_understanding = NaturalLanguageUnderstandingV1.new(
        version: "2019-07-12",
        authenticator: authenticator
    )
    @natural_language_understanding.service_url = "#{url}"

  end

end
