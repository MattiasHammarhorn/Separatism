class SMRoleInfoNorthernScout extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_Scout
    ClassTier=2
    ClassIndex=`ROCI_SCOUT // 1

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'Separatism.SMWeap_SKSYugo_Rifle',class'ROGame.ROWeap_MP40_SMG'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
        )}

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_scout'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_scout'
}