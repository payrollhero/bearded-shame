module BeardsHelper
  def massaged_label(beard)
    beard.is_massaged? ? 'Has massaged' : 'Has not massaged'
  end
end
