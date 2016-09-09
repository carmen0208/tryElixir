defmodule Issues.GithubIssues do 
   @user_agent  [ {"User-agent", "Elixir dave@pragprog.com"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
    #HTTPoison.get("#{Application.get_env(:issues, :github_url)}/repos/#{user}/#{project}/issues",@user_agent).body
  end
   def handle_response({:ok, %{status_code: 200, body: body}}) do
    { :ok, Poison.Parser.parse!(body) }
    #{:ok, body}
  end

  def handle_response({_, %{status_code: _, body: body}}) do
    { :error, Poison.Parser.parse!(body) }
    #{:error, body}
  end

  # use a module attribute to fetch the value at compile time
  @github_url Application.get_env(:issues, :github_url)
   def issues_url(user, project) do
     "#{@github_url}/repos/#{user}/#{project}/issues"
     #  "https://api.github.com/repos/#{user}/#{project}/issues"
   end

end
