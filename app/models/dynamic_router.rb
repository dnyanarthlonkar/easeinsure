class DynamicRouter
  def self.load
    EaseInsurance::Application.routes.draw do
      InsuranceType.all.each do |insurance_type|
        get "/#{insurance_type.permalink}", :to => "admin/insurance_types#show", defaults: { id: insurance_type.id }
      end
    end
  end

  def self.reload
    EaseInsurance::Application.routes_reloader.reload!
  end
end