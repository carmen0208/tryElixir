defmodule Customer do 
  defstruct name: "", company: ""
end

defmodule BugReport do 
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule User do
  report = %BugReport{owner: %Customer{name: "Carmen", company: "Ninja to be the best"}, details: "broken"}

  IO.inspect report

  report = %BugReport{report|owner: %Customer{ report.owner | company: "DingDing"}}

  IO.inspect report

  IO.inspect update_in(report.owner.name, &("Miss " <> &1))

end
