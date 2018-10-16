require 'byebug'

def callClarify
    a1 =   {
        "id": 13,
        "title": "Disarticulated Membranes",
        "date": 1994,
        "image_url": "https://s3-us-west-2.amazonaws.com/sfmomamedia/media/t/collection_images/HvcS9VaOvV9l.jpg",
        "artist": {
          "id": 10,
          "name": "Cara Judea Alhadeff",
          "nationality": null,
          "bio": null,
          "created_at": "2018-10-10T17:57:34.678Z",
          "updated_at": "2018-10-10T17:57:34.678Z"
        },
        "collection": "San Francisco Museum of Modern Art",
        "description": null
      }

    Clarifai::Rails::Detector.new(a1.image_url).image.concepts_with_percent
    byebug
end

callclar

