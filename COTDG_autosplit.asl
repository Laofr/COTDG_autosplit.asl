// Curse of the dead gods autosplitter by Lao_fr , improved by FollowTheDopamine

// Feel free to improve it. It's my 1st script ever.
// Feedback or bug report:
// Discord: CamaradeLao#6875 
// https://twitch.tv/lao_fr
// https://www.youtube.com/channel/UCltTM28Yx4eDBQlMT3upFYg


state("Curse of the Dead Gods")
{
	float IGT : 0x01206F30, 0xD8, 0x18E0;
	int roomnum : 0x011A2A50, 0x10, 0x89C;
	int victories : 0x01206F30, 0xD8, 0x1150;
}

startup
{
	settings.Add("removeLoads", true, "Load Removal");
	settings.SetToolTip("removeLoads", "Set this to true to remove loads and menu time");
	settings.Add("splitOnRoom", true, "Split on room");
	settings.SetToolTip("splitOnRoom", "Set this to true to split after every door");
	settings.Add("splitOnPortal", true, "Split on portal");
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

isLoading
{
	if (current.IGT == old.IGT && settings["removeLoads"])
	{
		return true;
	}
	else
	{
		return false;
	}
}
