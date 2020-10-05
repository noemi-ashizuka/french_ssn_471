require 'date'
require 'yaml'

# find the ssn pattern (rubular)
SSN_PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>0[1-9]|[1-9][0-9])\s?(?<random>\d{3}\s?\d{3})\s?(?<key>\d{2})/

def french_ssn_info(ssn)
  # check if the argument matches the pattern
  match_data = ssn.match(SSN_PATTERN)
  p match_data
  if match_data
    # if it matches return a string with the correct data
    gender = gender(match_data[:gender])
    month = month(match_data[:month])
    year = match_data[:year]
    department = department(match_data[:department])
    # p gender
    # p month
    # p year
    # p department
    return "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    # if it doesn't match return "The number is invalid"
    return "The number is invalid"
  end
end

def gender(code)
  return code == "1" ? "man" : "woman"
end

def month(code)
  return Date::MONTHNAMES[code.to_i]
end

def department(code)
  file = YAML.load_file('data/french_departments.yml')
  return file[code]
end
