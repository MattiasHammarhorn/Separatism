class SMRoleInfoSouthernRifleman extends SMRoleInfoSouthernInfantry;

defaultproperties
{
    RoleType=RORIT_Rifleman
    ClassTier=1
    ClassIndex=`ROCI_RIFLEMAN // 0

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle',class'Separatism.SMWeap_SKSYugo_Rifle'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
        )}
    
    bAllowPistolsInRealism=false

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_guerilla'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_guerilla'
}