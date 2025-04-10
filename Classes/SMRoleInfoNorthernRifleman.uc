class SMRoleInfoNorthernRifleman extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_Rifleman
    ClassTier=1
    ClassIndex=`ROCI_RIFLEMAN // 0

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'Separatism.SMWeap_AKM70_AssaultRifle',class'Separatism.SMWeap_SKSYugo_Rifle'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
        )}
    
    bAllowPistolsInRealism=false

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_grunt'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_grunt'
}