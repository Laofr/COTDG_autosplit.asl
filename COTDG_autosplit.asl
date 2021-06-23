// Curse of the dead gods autosplitter by Lao_fr , improved by FollowTheDopamine

// Feel free to improve it. It's my 1st script ever.
// Feedback or bug report:
// Discord: CamaradeLao#6875 
// https://twitch.tv/lao_fr
// https://www.youtube.com/channel/UCltTM28Yx4eDBQlMT3upFYg


state("Curse of the Dead Gods")
{
	float IGT : 0x011A2A68, 0x0, 0x9A0;
	int roomnum : 0x011A2A50, 0x8, 0x8E4;
	int victories : 0x01206FB0, 0xD8, 0x1158;
	float totalIGT : 0x01206FB0, 0xD8, 0x168;
}

startup
{
	settings.Add("syncIndividual", true, "Sync timer to temple time (individual temples)");
	settings.SetToolTip("syncIndividual", "Set this to true to sync your game time to the individual temple in game clock");

	settings.Add("syncMarathon", false, "Sync timer to profile time (marathon)");
	settings.SetToolTip("syncMarathon", "Set this to true to sync your game time to the profile in game clock");

	settings.Add("splitOnRoom", true, "Split on room");
	settings.SetToolTip("splitOnRoom", "Set this to true to split after every door");

	settings.Add("splitOnPortal", false, "Split on portal");
	settings.SetToolTip("splitOnPortal", "Set this to true to split on the portal after bosses");

	
}

start
{
	if (current.roomnum == 1 && old.roomnum == 0)
    {
        return true;
    }
}


split
{	
    if (current.roomnum > old.roomnum && settings["splitOnRoom"])
    {
			return true;
	} 
	if (current.victories == old.victories + 1 && settings["splitOnPortal"])
    {
			return true;
	} 
}

gameTime
{
	if(settings["syncIndividual"]) {
		return TimeSpan.FromSeconds(current.IGT);
	} else if(settings["syncMarathon"]) {
		return TimeSpan.FromSeconds(current.totalIGT);
	}	
}

isLoading
{
	return true;
}
