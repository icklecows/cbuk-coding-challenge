module TextProcessor
  def make_boolean(value)
    !negative?(value)
  end

  def standardise_date(value)
    value.strftime('%d/%m/%Y %H:%M:%S')
  end

  private

  def negative?(value)
    negative_indicators = [nil, '', 'N', 'No', [], {}, 0, '0']
    negative_indicators.include? value
  end
end