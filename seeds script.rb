require 'httparty'
require 'byebug'

SFMOMA_url_1 = "https://www.sfmoma.org/api/collection/artworks/?type=photograph&has_images=true&department=Photography&page_size=20&page=1"
SFMOMA_url_2 = "https://www.sfmoma.org/api/collection/artworks/?type=photograph&has_images=true&department=Photography&page_size=20&page=2"

SFMOMA_headers = {
    "Authorization" => "Token 5c6a3bfa479a3f383f4d3ced4c75c0a6c51fbe02"
}

ARTSY_url = "https://api.artsy.net/api/artists?gene_id=50356575ab7498000200000f&total_count=1&size=100"

ARTSY_headers = {
    "X-Xapp-Token" => "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IiIsImV4cCI6MTUzOTcwNjc4NSwiaWF0IjoxNTM5MTAxOTg1LCJhdWQiOiI1YmJjNzEzNTU3ZTY5YjFmMGYyNDA1YTQiLCJpc3MiOiJHcmF2aXR5IiwianRpIjoiNWJiY2Q1MjE4ZWUxNTI2YTVhMTU0ODVmIn0.quH_xr9J7tI7Tg8AGABKSatrn0czwj5Wege7UBzEVWQ"
}

RMIAPI_url = "https://api.art.rmngp.fr/v1/works?api_key=2b5f0f78c49d4fc7ca65cf71e55720f40aea49f5c68030fdd5e0de79331014cc&facets%5Bcollections%5D=Photographies&facets%5Bperiods%5D=Europe+%28p%C3%A9riode%29+-+p%C3%A9riode+contemporaine+de+1914+%C3%A0+nos+jours&per_page=100"
FINNAT_url = "http://kokoelmat.fng.fi/api/v2?apikey=jn36avefund5l&q=search:photograph&format=dc-json"
HARVARD_url = "https://api.harvardartmuseums.org/object?apikey=5bccaf40-c23b-11e8-9f63-d310d7ffc861&classification=17&technique=123&size=100&hasimage=1&page=2"

def callSFMOMA
    response = HTTParty.get(SFMOMA_url_1, :headers => SFMOMA_headers)
    artists_data = response["results"].map do |result|
        !result["artists"][0]["artist"]["name_display"].include?("Unknown") ? 
        {
            name: result["artists"][0]["artist"]["name_display"]
        } : null
    end
    unique_artists = artists_data.uniq
    artworks_data = response["results"].map do |result|
        !result["artists"][0]["artist"]["name_display"].include?("Unknown") ? 
        {
            title: result["title"]["display"],
            date: result["date"]["display"],
            image_url: result["images"][0]["public_image"],
            artist: unique_artists.find{ |artist| artist[:artist] == result["artists"][0]["artist"]["name_display"]}
        } : null
    end
end

def callARTSY
    response = HTTParty.get(ARTSY_url, :headers => ARTSY_headers)
end

def callRMIAPI
    response = HTTParty.get(RMIAPI_url)
    artist_names = response["hits"]["hits"].map do |result|
        if !!result["_source"]["authors"][0]
        result["_source"]["authors"][0]["name"]["en"]
        end
    end
    unique_artists = artist_names.compact.uniq
    artworks_data = response["hits"]["hits"].map do |result|
        if !!result["_source"]["authors"][0]
        {
            title: result["_source"]["title"][result["_source"]["title"].keys.first],
            date: result["_source"]["date"] ? result["_source"]["date"]["display"].to_i : nil,
            image_url: result["_source"]["images"][0]["urls"]["original"],
            artist: unique_artists.find{|artist| result["_source"]["authors"][0]["name"]["en"] == artist}
        }
        end
    end
end


def callHARVARD
    response = HTTParty.get(HARVARD_url)
    artist_names = response["records"].map do |result|
        if result["images"].length != 0 && result["people"][0]["name"] != "Unidentified Artist"
            {
                name: result["people"][0]["name"],
                nationality: result["culture"]
            }
        end
    end
    unique_artist_names = artist_names.compact.uniq

    artworks_data = response["records"].map do |result|
        if result["images"].length != 0 && result["people"][0]["name"] != "Unidentified Artist"
            {
                title: result["title"],
                date: result["datebegin"],
                image_url: result["images"][0]["baseimageurl"], 
                artist: unique_artist_names.find{|artist| artist[:name] == result["people"][0]["name"]},
                collection: result["creditline"]
            }
        end
    end
    byebug
end


def callFINNNatGallery
    response = HTTParty.get(FINNAT_url)
    artist_names = response["descriptionSet"].map do |result|
        if !!result["title"]
            result["creator"][0]["value"].split(", ")[1] + " " + result["creator"][0]["value"].split(", ")[0]
        end
    end

    unique_artist_names = artist_names.uniq

    artworks_data = response["descriptionSet"].map do |result|
        if !!result["title"]
            {
                title: result["title"][1] ? result["title"][1]["en"] : result["title"][0]["fi"], 
                date: result["date"][0]["creation"].to_i,
                image_url: "http://kokoelmat.fng.fi/app?action=image&profile=CC0&iid=#{result["relation"][0]["image"]}",
                artist: unique_artist_names.find{|artist| artist == result["creator"][0]["value"].split(", ")[1] + " " + result["creator"][0]["value"].split(", ")[0]},
                collection: result["publisher"][0]["unit"] + ", Finnish National Gallery",
                description: !!result["description"] ? result["description"][1]["en"] : nil
            }
        end
    end
    byebug
end

callFINNNatGallery
