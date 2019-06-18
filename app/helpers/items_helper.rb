module ItemsHelper
  def converting(price)
    "¥ #{price.to_s(:delimited, delimiter: ',')}"
  end
end
