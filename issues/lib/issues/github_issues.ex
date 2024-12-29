defmodule Issues.GithubIssues do

@moduledoc """
  Using the GitHub API, request the issues for a user's project.
  If there was no error, parse the JSON results.
  """

  require Logger

  @user_agent [{"User-agent", "Elxir dave@pragprog.com"}]

  @github_url Application.get_env(:issues, :github_url)

  @doc """
  Sends the HTTP GET request
  """
  def fetch(user, project) do
    Logger.info("Fetching #{user}'s #{project}")

    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end
  
  @doc """
  Constructs the GitHub API request from user and project
  """
  def issues_url(user,project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({_, %{status_code: status_code, body: body} }) do
    Logger.info("Got response: status code = #{status_code}")

    {
      status_code |> check_for_error,
      body |> Poison.Parser.parse!()
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error

end