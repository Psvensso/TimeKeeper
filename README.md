# TimeKeeper demo app
Buildt with Phoenixframework
Requires Elixir installed and Postgres with u/p: postgres/postgres

To start the app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Phoenixframework links

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## To do
  * SAdmin page
    - User > SAdmin portal
    - Add/edit customers etc
    - Print reports
    - Execute salary calculations
    - Approve additional timesheets
    - Register users
    
  * Customer admin page
    - User > manage your stuff
    - Approve additional timesheets

  * Profile
    - Alter personal info
    - See registred hours
    - Add manual timesheets

  * Logg

  * Workplace page
    - IP blocks (setting)
    - Stamp page (guid, rfid usage) (setting)
