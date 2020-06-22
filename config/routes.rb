Rails.application.routes.draw do

  root to: 'welcome#index'

  # RSS Feed
  get '/rss-ElPais' => 'welcome#rssElPais'
  get '/rssSearch' => 'welcome#rssSearch'


  # Speech to Text service
  get '/speechToText' => 'welcome#sendAudio'
  post '/audioResult' => 'welcome#speechToText'

  # URL Analysis Service
  get '/urlAnalysis' => 'welcome#sendURL'
  post '/urlsearch' => 'welcome#searchURL'

  # Text Analysis Service
  get '/textAnalyze' => 'welcome#sendTextAnalysis'
  post '/textanalyze' => 'welcome#analyzeTextResult'

  # Devise routes
  devise_scope :user do
    get "devise/sessions#new" => 'devise/sessions#new'
  end
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end



end
