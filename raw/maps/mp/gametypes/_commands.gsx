init()
{
    [[level.onAddCommand]]("time", ::timePl, ::timeRc, 1);
}

AddCommand( cmd, handlerPlayer, handlerRcon, point)
{
	addscriptcommand( cmd, point );
	level.command = [];
	level.command[cmd] = spawnstruct();
	level.command[cmd].funcPlayer = handlerPlayer;
	level.command[cmd].funcRcon = handlerRcon;
}

timePl( arguments )
{
	date = TimeToString(getRealTime(), 0, "%c" );
  	self iprintln( "Current time " + date );
}
timeRc( arguments )
{
  	date = TimeToString( getRealTime(), 0, "%c" );
  	print( "Current time " + date );
}
