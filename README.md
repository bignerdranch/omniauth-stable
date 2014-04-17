# OmniAuth Stable

This is the official OmniAuth strategy for authenticating to Stable. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Stable OAuth Applications Page](https://stable.bignerdranch.com/oauth/applications).

## Basic Rails Usage

In your `Gemfile`:

    gem 'omniauth-stable', github: 'bignerdranch/omniauth-stable'

Then in your OmniAuth initializer add:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :stable, ENV['STABLE_KEY'], ENV['STABLE_SECRET']
    end

And add the callback route to your `routes.rb`:

    get '/auth/:provider/callback', to: 'sessions#create'


Finally implement the `sessions#create` endpoint or whatever endpoint you decide to point the callback to setup your user's session.


## Development

New features or bug fixes are accepted via Pull Requests on GitHub. Please add test coverage for bugs and features and be sure the test suite is passing by running the tests:

    bundle exec rspec


## License

Copyright (c) 2013 Big Nerd Ranch.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
