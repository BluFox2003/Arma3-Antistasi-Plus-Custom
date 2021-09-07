////////////////////////////////////
//RHS WEAPON ATTACHMENTS REDUCER ///
////////////////////////////////////
lootAttachment = lootAttachment select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Community Upgrade Project"};
allLightAttachments = allLightAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Community Upgrade Project"};
allLaserAttachments = allLaserAttachments select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Community Upgrade Project"};
