defmodule EctoTest.Repo do 
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  # CREATE DATABASE ecto_test ENCODING='UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8'
  def url do 
    "ecto://postgres:postgres@localhot/ecto_test"
  end

  def priv do 
    app_dir(:ecto_test, "priv/repo")
  end
end
