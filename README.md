# CoD4MW

Gsc scripts with bug fixes for [CoD4xServer](https://github.com/callofduty4x/CoD4x_Server) modification.

# Custom CVAR

- ```scr_antinadeswitch``` - Removes grenades when changing teams. Default 1

- ```scr_teambalance_check_time``` - Team balance check time. Default 59 

# An example of adding new chat commands
  ```[[level.onAddCommand]](command, functionPlayer , functionRcon, points);```
  
  ```command``` - command name
  
  ```functionPlayer``` - command function when called by the player
  
  ```functionRcon``` - command function when called by console or rcon
  
  ```points``` - needed power points for using this command
  