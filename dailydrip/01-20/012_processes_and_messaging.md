## Process

Process share no memory with one another, and can only communicate with each other via asynchronous messages

## demo

```sh
mix new process_playground && cd process_playground
```

* The demo is about when send ping, it returns pong


```sh
mix test
```

```sh
iex -S mix
pong = spawn_link(Pong, :start, [])
ping = spawn_link(Ping, :start, [])
send ping, {:ping, pong}
# pong will maintain their own status. 1....n times
```
