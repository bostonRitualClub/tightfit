# tightfit

#### Setup

1. Install ruby 2.4.1
2. Install bundler for the latest version `gem install bundler`
3. `bundle install`
4. `git remote add staging https://git.heroku.com/tightfit-staging.git`
5. `git remote add heroku https://git.heroku.com/tightfit.git`

Always deploy to staging first with `git push staging`

```
$ echo "RACK_ENV=development" >>.env
$ echo "PORT=3000" >> .env
```
