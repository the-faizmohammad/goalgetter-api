Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:5173'  # Frontend URL (Vite)
      resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
    end
  end
  