# Sequence

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `sequence` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:sequence, "~> 0.1.0"}]
    end
    ```

  2. Ensure `sequence` is started before your application:

    ```elixir
    def application do
      [applications: [:sequence]]
    end
    ```
## Command Line
```elixir

iex(1)>  Sequence.Server.increment_number 3
:ok
iex(2)>  Sequence.Server.next_number
126
# makeing server to die
iex(3)>  Sequence.Server.next_number "cat"
** (UndefinedFunctionError) function Sequence.Server.next_number/1 is undefined or private. Did you mean one of:

      * next_number/0

    (sequence) Sequence.Server.next_number("cat")
iex(3)>  Sequence.Server.increment_number "cat"
:ok
iex(4)>
10:26:32.625 [error] GenServer Sequence.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    (sequence) lib/sequence/server.ex:26: Sequence.Server.handle_cast/2
    (stdlib) gen_server.erl:601: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:667: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:increment_number, "cat"}}
State: [data: [{'State', "My current state is '127', and I'm happy"}]]

nil
#supervisor makes it restart again with an inital number
iex(5)> Sequence.Server.next_number
123
iex(6)> Sequence.Server.next_number
124
```
   * increment the number no matter crash or not
   ```elixir
 ∴ iex -S mix
Erlang/OTP 19 [erts-8.0.2] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiling 1 file (.ex)
Interactive Elixir (1.3.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Sequence.Server.next_number
123
iex(2)> Sequence.Server.next_number
124
iex(3)> Sequence.Server.increment_number 100
:ok
iex(4)> Sequence.Server.next_number
225
iex(5)> Sequence.Server.increment_number "cause it to creash"
:ok
iex(6)>
14:23:22.822 [error] GenServer Sequence.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    (sequence) lib/sequence/server.ex:24: Sequence.Server.handle_cast/2
    (stdlib) gen_server.erl:601: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:667: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:increment_number, "cause it to creash"}}
State: [data: [{'State', "My current state is '{226, #PID<0.120.0>}', and I'm happy"}]]

nil
iex(7)> Sequence.Server.next_number
226
iex(8)> Sequence.Server.next_number
227
iex(9)>
   ```
