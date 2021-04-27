state("Curse of the Dead Gods")
{
	float IGT : 0x01206F30, 0xD8, 0x18E0;
   int levelnum : 0x011A2A50, 0x10, 0x89C;

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
	if (current.levelnum == 1 && old.levelnum == 0)
    {
        return true;
    }
}


split
{	
    if (current.levelnum > old.levelnum)
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
