Rails.application.config.to_prepare do
  Prefecture.data = [
      {:id => 1, :name => "北海道"},
      {:id => 2, :name => "青森県"},
      
  ]
end