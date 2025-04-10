class SMRoleInfoSouthernRadioman extends SMRoleInfoSouthernInfantry;

defaultproperties
{
    RoleType=RORIT_Radioman
    ClassTier=3
    ClassIndex=`ROCI_RADIOMAN // 7

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_MP40_SMG',class'ROGame.ROWeap_M1A1_SMG'),
                    OtherItems=(class'ROGame.ROWeap_M8_Smoke')
        )}
    
    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_radioman'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_radioman'
}