# Sinatra With Trailblazer

_Cause We Can._

## Stack

The following gems are used in this project.

| Gem | Layer |
|---|---|
| Sinatra | Infrastructure, Routing |
| Trailblazer | Business |
| Reform | Validation |
| Dry-validation | Validation |
| Cells | Presentation |
| Slim | Presentation |

## Run

In development, start the server with

```ruby
rerun "bundle exec ruby app.rb"
```

And browse to `http://localhost:4567/posts/new`.

## Runing whit docker

```shell
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.3 bundle install
docker build -t gemgem-sinatra .
scripts/run.sh up
```

## Running tests

```shell
scripts/run.sh bundle exec rspec spec/concepts/operation_spec.rb
```

