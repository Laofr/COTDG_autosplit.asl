// Curse of the dead gods autosplitter by Lao_fr

// Feel free to improve it. It's my 1st script ever.
// Feedback or bug report:
// Discord: CamaradeLao#6875 
// https://twitch.tv/lao_fr
// https://www.youtube.com/channel/UCltTM28Yx4eDBQlMT3upFYg


state("Curse of the Dead Gods")
{
	float IGT : 0x01206F30, 0xD8, 0x18E0;
   int roomnum : 0x011A2A50, 0x10, 0x89C;

}

// Startup
startup
{
    settings.Add("option1", true, "Load Removal");
	settings.SetToolTip("option1", "Remove loads");
}

 //

start
{
	if (current.roomnum == 1 && old.roomnum == 0)
    {
        return true;
    }
}


split
{	
    if (current.roomnum > old.roomnum)
    {
			return true;
	 } 
}

isLoading
{
	if (current.IGT == old.IGT && settings["option1"])
	{
		return true;
	}
	else
	{
		return false;
	}
}
