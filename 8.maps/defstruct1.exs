defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do 
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end


#iex(18)> a1 = %Attendee{name: "Carmen", over_18: true}
#%Attendee{name: "Carmen", over_18: true, paid: false} 
#iex(19)> Attendee.may_attend_after_party(a1) 
#false
#iex(20)> a2 = %Attendee{a1 | paid: true} 
#** (SyntaxError) iex:20: unexpected token: "" (column 21, codepoint U+200B)

#iex(20)> a2 = %Attendee{a1 | paid: true} 
##%Attendee{name: "Carmen", over_18: true, paid: true}
#iex(21)> Attendee.may_attend_after_party(a2)
#true
#iex(22)> Attendee.print_vip_badge(a2)
#Very cheap badge for Carmen
#:ok
#iex(23)> a3 = %Attendee{}
#%Attendee{name: "", over_18: true, paid: false}
#iex(24)> Attendee.print_vip_badge(a3)
#** (RuntimeError) missing name for badge
#    defstruct1.exs:13: Attendee.print_vip_badge/1
#
