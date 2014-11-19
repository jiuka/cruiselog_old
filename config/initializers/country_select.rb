# Custom country_select format
CountrySelect::FORMATS[:with_alpha2] = lambda do |country|
    "#{country.translations[I18n.locale.to_s] || country.name} (#{country.alpha2})"
end
