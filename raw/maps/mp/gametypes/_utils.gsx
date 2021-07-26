
mess_nextmap()
{
	
	level.MapNames = [];
	level.MapNames["mp_convoy"] = "Ambush";
	level.MapNames["mp_backlot"] = "Backlot";
	level.MapNames["mp_bloc"] = "Bloc";
	level.MapNames["mp_bog"] = "Bog";
	level.MapNames["mp_broadcast"] = "Broadcast";
	level.MapNames["mp_carentan"] = "Chinatown";
	level.MapNames["mp_countdown"] = "Countdown";
	level.MapNames["mp_crash"] = "Crash";		
	level.MapNames["mp_creek"] = "Creek";
	level.MapNames["mp_crossfire"] = "Crossfire";
	level.MapNames["mp_citystreets"] = "District";
	level.MapNames["mp_farm"] = "Downpour";
	level.MapNames["mp_killhouse"] = "Killhouse";	
	level.MapNames["mp_overgrown"] = "Overgrown";
	level.MapNames["mp_pipeline"] = "Pipeline";
	level.MapNames["mp_shipment"] = "Shipment";
	level.MapNames["mp_showdown"] = "Showdown";
	level.MapNames["mp_strike"] = "Strike";
	level.MapNames["mp_vacant"] = "Vacant";
	level.MapNames["mp_cargoship"] = "Wet Work";
	level.MapNames["mp_crash_snow"] = "Winter Crash";
	
	level.GametypeNames = [];
	level.GametypeNames["dm"] = "Free for All";
	level.GametypeNames["dom"] = "Domination";
	level.GametypeNames["koth"] = "Headquarters";
	level.GametypeNames["sab"] = "Sabotage";
	level.GametypeNames["sd"] = "Search and Destroy";
	level.GametypeNames["war"] = "Team Deathmatch";
	
	for( ;; )
	{
	IPrintLn( self Get_Next_Map() );
	wait 30;
	}

}

Get_Next_Map()
{
	maprot = "";

	maprot = strip(getDvar("sv_maprotationcurrent"));

	if(maprot == "")
		maprot = strip(getDvar("sv_maprotation"));

	if(maprot == "")
		return undefined;

	j=0;
	temparr2[j] = "";
	for(i=0;i<maprot.size;i++)
	{
		if(maprot[i]==" ")
		{
			j++;
			temparr2[j] = "";
		}
		else
			temparr2[j] += maprot[i];
	}

	map = undefined;
	gt = undefined;

	for(i=0;i<temparr2.size;i++)
	{
		if (isDefined(map))
			break;

		if (temparr2[i] == "gametype")
		{
			n = temparr2.size - i;
			for (x=1;x<n ;x++ )
			{
				if (temparr2[i+x] != " ")
					gt = temparr2[i+x];
					break;
			}
		}
		else if (temparr2[i] == "map")
		{
			n = temparr2.size - i;
			for (x=1;x<n ;x++ )
			{
				if (temparr2[i+x] != " ")
				{
					map = temparr2[i+x];
					break;
				}
			}
		}
	}

	if (!isdefined(map))
		return undefined;

	if (!isdefined(gt))
		gt = getDvar("g_gametype");

	nextmap = "^3Next Map: ^2" + level.MapNames[ map ] + " (" + level.GametypeNames[ gt ] + ")";

	return nextmap;
}

strip(s)
{
	if(s=="")
		return "";

	s2="";
	s3="";

	i=0;
	while(i<s.size && s[i]==" ")
		i++;

	if(i==s.size)
		return "";

	for(;i<s.size;i++)
	{
		s2 += s[i];
	}

	i=s2.size-1;
	while(s2[i]==" " && i>0)
		i--;

	for(j=0;j<=i;j++)
	{
		s3 += s2[j];
	}

	return s3;
}