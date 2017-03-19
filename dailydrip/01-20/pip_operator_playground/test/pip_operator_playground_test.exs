defmodule Unix do

  def ps_ax do 
    """
  PID   TT  STAT      TIME COMMAND
    1   ??  Ss     1:23.43 /sbin/launchd
   38   ??  Ss     0:10.87 /usr/libexec/UserEventAgent (System)
 5920   ??  Ss     0:00.07 /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDecoderXPCService.xpc/Contents/MacOS/VTDecoderXPCService
 6197 s003  Ss     0:00.03 /Applications/iTerm.app/Contents/MacOS/iTerm2 --server /usr/bin/login -fpl carmenliu /Applications/iTerm.app/Contents/MacOS/iTerm2 --launch_shell
 6198 s003  S      0:00.05 /usr/bin/login -fpl carmenliu /Applications/iTerm.app/Contents/MacOS/iTerm2 --launch_shell
 6199 s003  S      0:00.59 -zsh
 6807 s003  S+     0:01.13 nvim test/pip_operator_playground_test.exs
 6880 s003  R+     0:00.00 ps ax
    """
  end
  def grep(input, match) do 
    String.split(input, "\n")
      |> Enum.filter(fn(line) -> Regex.match?(match, line) end )
    #lines = String.split(input, "\n")
    #Enum.filter(lines, fn(line) -> Regex.match?(match, line) end )
  end
  
  def awk(lines, column) do 
    Enum.map(lines, fn(line) ->
      stripped = String.strip(line)
      Regex.split(~r/ /, stripped, trim: true)
        |> Enum.at(column-1)
      #columns = Regex.split(~r/ /, stripped, trim: true)
      #Enum.at(columns, column-1)
    end)
  end
end
defmodule PipOperatorPlaygroundTest do
  use ExUnit.Case
  
  test "ps_ax outputs some processes" do
    output = """
  PID   TT  STAT      TIME COMMAND
    1   ??  Ss     1:23.43 /sbin/launchd
   38   ??  Ss     0:10.87 /usr/libexec/UserEventAgent (System)
 5920   ??  Ss     0:00.07 /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDecoderXPCService.xpc/Contents/MacOS/VTDecoderXPCService
 6197 s003  Ss     0:00.03 /Applications/iTerm.app/Contents/MacOS/iTerm2 --server /usr/bin/login -fpl carmenliu /Applications/iTerm.app/Contents/MacOS/iTerm2 --launch_shell
 6198 s003  S      0:00.05 /usr/bin/login -fpl carmenliu /Applications/iTerm.app/Contents/MacOS/iTerm2 --launch_shell
 6199 s003  S      0:00.59 -zsh
 6807 s003  S+     0:01.13 nvim test/pip_operator_playground_test.exs
 6880 s003  R+     0:00.00 ps ax
    """

    assert Unix.ps_ax == output
  end

  test "grep(lines, thing) returns lines that match 'thing'" do 
    lines = """
    foo
    bar
    thing foo
    baz
    thing qux
    """
    output = ["thing foo", "thing qux"]
    assert Unix.grep(lines, ~r/thing/) == output
  end

  test "awk(input, 1) split on whitespace and return the first column" do 
    input = ["foo bar", " baz qux"]
    output = ["foo", "baz"]
    assert Unix.awk(input, 1) == output
  end

  test "the whole pipeline works" do
    output = ["6807"]
    assert (Unix.ps_ax |> Unix.grep(~r/vim/) |> Unix.awk(1)) == output

    # assert Unix.awk(Unix.grep(Unix.ps_ax, 'vim'), 1) == output
  end
end
