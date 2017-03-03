class BabyWeaningDiary


  def search(term)
    url = "https://api.nutritionix.com/v1_1/search/#{term.gsub(' ', '%20')}?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=c1fb1c2e&appKey=ea5f4950b4838ffa144bbeb2995715b1"
    response = JSON.parse(Net::HTTP.get(URI(url)))
    term_details = []
    hits_length = response["hits"].length.to_i

    hits_length.times do |x|
      if response["hits"][x]["fields"]["item_name"].downcase.include? term
        nam = response["hits"][x]["fields"]["item_name"]
        nam = {"Item Name" => "#{nam}"}
        cal = response["hits"][x]["fields"]["nf_calories"]
        cal = {"Calories" => "#{cal}"}
        fat = response["hits"][x]["fields"]["nf_total_fat"]
        fat = {"Total Fat" => "#{fat}"}
        term_details << {"#{x}" => [nam, cal, fat]}
      else
        return nil
      end
    end

    return term_details
    # puts "This is the number of calories #{term} has #{cal}"
    # puts "It matched. Here is the repsonse for #{term}"

    # puts "Not found sorry"
    # puts response
  end

end
#
# def search(term)
#  url = "https://api.nutritionix.com/v1_1/search/#{term.gsub(' ', '%20')}?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=c1fb1c2e&appKey=ea5f4950b4838ffa144bbeb2995715b1"
#  response = JSON.parse(Net::HTTP.get(URI(url)))
#  term_details = []
#
#  if response["hits"][0]["fields"]["item_name"].downcase.include? term
#    nam = response["hits"][0]["fields"]["item_name"]
#    cal = response["hits"][0]["fields"]["nf_calories"]
#    term_details.push(cal, nam)
#    return term_details
#     # puts "This is the number of calories #{term} has #{cal}"
#     # puts "It matched. Here is the repsonse for #{term}"
#
#     # puts "Not found sorry"
#     # puts response
#  end
# end
