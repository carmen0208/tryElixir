### Unix Shell Pipe operator

```sh
ps aux
ps aux| grep vim
ps aux | grep vim | awk '{print $2}'
```
### Pipe Operator

```sh
mix new pipe_operator_playground && pipe_operator_playground
```
### VIM read in Command Line

```sh
:r !ps aux
```
