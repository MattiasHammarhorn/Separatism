class SMRoleInfoNorthernCommander extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_Commander
    ClassTier=4
    ClassIndex=`ROCI_COMMANDER // 4
    bIsTeamLeader=true

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'Separatism.SMWeap_AKM70_AssaultRifle',class'Separatism.SMWeap_SKSYugo_Rifle',class'ROGame.ROWeap_MP40_SMG'),
                    OtherItems=(class'ROGame.ROWeap_RDG1_SmokeSingle',class'ROGame.ROItem_Binoculars')
        )}
    
    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_commander'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_commander'
}