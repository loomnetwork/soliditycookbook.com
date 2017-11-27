# encoding: utf-8

page '/index.html'

#
# Use webpack for assets
#
activate :external_pipeline,
         name: :webpack,
         command: build? ?  "yarn run build" : "yarn run start",
         source: ".tmp/dist",
         latency: 1

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascript'
set :images_dir, 'images'
activate :directory_indexes

activate :blog do |blog|
  blog.permalink = "/blog/{title}"
  blog.sources = "blog/{title}.html"
  blog.layout = "blog_layout"
  blog.summary_separator = '=========='
end

# Build-specific configuration
configure :build do
  # Enable cache buster (except for images)
  activate :asset_hash, ignore: [/\.jpg\Z/, /\.png\Z/]
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'soliditycookbook.com' # The name of the S3 bucket you are targeting. This is globally unique.
  s3_sync.region                     = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
  s3_sync.error_document             = '404.html'
end

default_caching_policy max_age:(60 * 60 * 24 * 365)
