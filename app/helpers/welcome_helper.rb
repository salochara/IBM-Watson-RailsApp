module WelcomeHelper
  class MyRecognizeCallback < IBMWatson::RecognizeCallback
    def initialize
      super
    end

    def on_transcription(transcript:)
      puts JSON.pretty_generate(transcript)
    end

    def on_connected
      puts "Connection was successful"
    end

    def on_error(error:)
      puts "Error received: #{error}"
    end

    def on_inactivity_timeout(error:)
      puts "Inactivity timeout: #{error}"
    end

    def on_listening
      puts "Service is listening"
    end

    def on_transcription_complete
      puts "Transcription completed"
    end

    def on_hypothesis(hypothesis:)
      puts hypothesis.to_s
    end

    def on_data(data:)
      puts data.to_s
    end
  end

end
