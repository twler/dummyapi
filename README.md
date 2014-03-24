A simple JSON API with dummy User and Item paths that give random data on command, rate-limited to 60 requests per minute.  Use this site as your dummy API, or clone and modify for your own purposes.

Repo at http://github.com/twler/dummyapi

Demo API at http://dummyapi.herokuapp.com

Note: the api_key parameter must be set to 123456789 for each request or you will receive an error.

**Users List**

Returns a list of 20 random Users with the following parameters:
`:id`, `:name`, `:username`, `:email`, `:created_at`, `:company: {
:name, :tagline, :description }`

    /api/v1/users

**Items List**

Returns a list of 20 random Items with the following parameters:
`:id`, `:title`, `:category`, `:color`, `:code`, `:user_id`, `:created_at`

    /api/v1/items

Also accepts the options `limit` and `user_id`, which will limit the number of items returned (max: 50) and set the `user_id`, respectively.

    /api/v1/items?limit=5
    /api/v1/items?user_id=123

**Items Show**

Returns an Item with the following parameters:

`:id` (set to number in path), `:title`, `:category`, `:color`, `:code`, `:user_id`, `:created_at`

    /api/v1/items/456
    
Also accepts the `user_id` option, which will set the user_id

    /api/v1/items/456?user_id=123