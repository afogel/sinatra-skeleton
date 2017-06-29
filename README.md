Sinatra
=============

Forked from lighthouse labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

## Design Decisions
The intent behind creating this skeleton is to provide a lightweight framework that has some built in security, authentication, and authorization with minimal dependencies so you (at least, I) can just start coding.

It is structured to mirror some rails conventions, such as the structuring of files and its use of ActiveRecord.

### Security
This sinatra skeleton implements all the out of the box security features of [rack protection](https://github.com/sinatra/sinatra/tree/master/rack-protection).

### Baseline Dependency Opinions
The database preference of this skeleton is Postgresql.
The testing framework preference of this skeleton is RSpec.
The debugger of choice is pry-byebug.
The environment variable manager of choice is dotenv.
