module ApplicationHelper
  def number_to_currency_gbp(number)
    number_to_currency(number, :unit => "£ ", :delimiter => ",", precision: 2)
  end

end
