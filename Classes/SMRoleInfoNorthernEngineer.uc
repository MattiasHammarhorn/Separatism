class SMRoleInfoNorthernEngineer extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_Engineer
    ClassTier=3
    ClassIndex=`ROCI_ENGINEER // 4

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'Separatism.SMWeap_SKSYugo_Rifle',class'ROGame.ROWeap_MP40_SMG'),
                    OtherItems=(class'ROGame.ROWeap_MD82_Mine',class'ROGame.ROWeap_C4_Explosive')
        )}
    
    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_sapper'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_sapper'
}