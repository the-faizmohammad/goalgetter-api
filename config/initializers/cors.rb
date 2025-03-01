Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Change '*' to specific domains if needed (e.g., 'http://localhost:3001')
  
      resource '*',
        headers: :any,
        expose: ["Authorization"], # Allows exposing JWT token in responses
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  