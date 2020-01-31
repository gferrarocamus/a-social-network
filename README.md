# A Social Network

This site is a social network in the style of Facebook, where users can sign up, friend other users, and share posts.

Based on our previous [building-facebook](https://github.com/gferrarocamus/building-facebook) project, it is built with Ruby on Rails, using Devise and OmniAuth for authentication and RSpec for testing.

## Features

- Sign up with your actual Facebook account or create an account providing email
  and password
- Search for other users and send them friend requests
- Get notifications when someone sends you a friend request
- Create text or image posts
- See, like, and comment on your friends' posts

## Future Features

- Support profile picture upload
- Make posts polymorphic for greater flexibility

## Install

In order to run the site, you need to have
[Ruby on Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)
installed. Then you can clone this repository and install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Run the test suite to verify that everything is working correctly:

```
$ bundle exec rspec
```

Finally, fire up a local server:

```
$ rails server
```

## Live Version

You can see it live [here](https://not-so-social-network.herokuapp.com/).

## License

MIT © 2020 Giuliana Ferraro

---

![A Social Network Demo](/wiki/a-social-network-demo.png)
