class SMRoleInfoSouthernGrenadier extends SMRoleInfoSouthernInfantry;

defaultproperties
{
    RoleType=RORIT_Support
    ClassTier=2
    ClassIndex=`ROCI_HEAVY // 5

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'ROGame.ROWeap_MAS49_Rifle_Grenade'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
        )}
    
    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_grenadier'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_grenadier'
}