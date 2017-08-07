class AppName
  def initialize(app)
    @app = app
  end

  def call(env)
    # ['200', {'Content-Type' => 'text/html'}, ["#{env}"]]
    return ['200', {'Content-Type' => 'text/html'}, ["Notebook API"]] if env['ORIGINAL_FULLPATH'] == '/'
    status, headers, response = @app.call(env)
    headers.merge!({'X-App-Name' => 'Notebook API'})
    [status, headers, [response.body]]
  end
end
