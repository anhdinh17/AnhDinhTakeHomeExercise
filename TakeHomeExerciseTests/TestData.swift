//
//  TestData.swift
//  TakeHomeExerciseTests
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

let mockRecipeData = """
    {
      "recipes": [
        {
          "cuisine": "Malaysian",
          "name": "Apam Balik",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
          "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
          "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
          "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        },
        {
          "cuisine": "British",
          "name": "Apple & Blackberry Crumble",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
          "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
          "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
          "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
        },
        {
          "cuisine": "British",
          "name": "Apple Frangipan Tart",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
          "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
          "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
        },
        {
          "cuisine": "British",
          "name": "Bakewell Tart",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg",
          "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
          "youtube_url": "https://www.youtube.com/watch?v=1ahpSTf_Pvk"
        },
        {
          "cuisine": "American",
          "name": "Banana Pancakes",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
          "source_url": "https://www.bbcgoodfood.com/recipes/banana-pancakes",
          "uuid": "f8b20884-1e54-4e72-a417-dabbc8d91f12",
          "youtube_url": "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
        },
        {
          "cuisine": "British",
          "name": "Battenberg Cake",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/small.jpg",
          "source_url": "https://www.bbcgoodfood.com/recipes/1120657/battenberg-cake",
          "uuid": "891a474e-91cd-4996-865e-02ac5facafe3",
          "youtube_url": "https://www.youtube.com/watch?v=aB41Q7kDZQ0"
        },
        {
          "cuisine": "Canadian",
          "name": "BeaverTails",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/small.jpg",
          "source_url": "https://www.tastemade.com/videos/beavertails",
          "uuid": "b5db2c09-411e-4bdf-9a75-a194dcde311b",
          "youtube_url": "https://www.youtube.com/watch?v=2G07UOqU2e8"
        },
        {
          "cuisine": "British",
          "name": "Blackberry Fool",
          "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/large.jpg",
          "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/small.jpg",
          "source_url": "https://www.bbc.co.uk/food/recipes/blackberry_fool_with_11859",
          "uuid": "8938f16a-954c-4d65-953f-fa069f3f1b0d",
          "youtube_url": "https://www.youtube.com/watch?v=kniRGjDLFrQ"
        }
    ]
}
""".data(using: .utf8)!